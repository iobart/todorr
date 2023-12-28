import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/data/dtos/user_model_dto.dart';
import 'package:todorr/core/data/models/todo_model.dart';

class TodoApi {
  final Logger _logger = Logger();
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("users");
 final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference _todoCollection =
      FirebaseFirestore.instance.collection('todo');

  ///this method is user to register user
  Future<bool> registerUser(UserDTO user) async {
    try {
      if (user.email == null || user.password == null) {
        throw Exception('El correo y la contraseña son obligatorios.');
      }

      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (userCredential.user != null) {
        final userId = userCredential.user!.uid;

        await _firestore.doc(userId).set({
          'id': userId,
          'email': user.email,
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _logger.e('Error al registrar al usuario: $e');
      return false;
    }
  }

  ///this method is user to authenticate user
  Future<UserDTO> authUser(UserDTO user) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (userCredential.user != null) {
        String? userId = userCredential.user?.uid;
        String? userEmail = userCredential.user?.email;
        UserDTO authenticatedUser = UserDTO(
          id: userId,
          email: userEmail,
        );
        return authenticatedUser;
      }
      return UserDTO();
    } catch (e) {
      _logger.e(e);
      return UserDTO();
    }
  }

  ///this method is user to logout user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.e(e);
    }
  }

 Future<bool> addTodo(TodoModel todoModel) async {
  User? user = _auth.currentUser;
  if (user == null) {
    _logger.e('User not found');
    return false;
  }
  DocumentReference userReference = FirebaseFirestore.instance.collection('users').doc(user.uid);
  TodoModel data =TodoModel(
  title: todoModel.title,
    description: todoModel.description,
    state: todoModel.state,
    date: todoModel.date,
    createdByUserId: userReference
  );

  try {
    await _todoCollection.add(data.toJson());
    return true;
  } catch (e) {
    _logger.e(e);
    return false;
  }
}

 Stream<QuerySnapshot<TodoModelDto>>? getListTodo() {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return null;
  }
  String userId = currentUser.uid;
  DocumentReference userReference =
       FirebaseFirestore.instance.collection('users').doc(userId);
  return _todoCollection
      .where('createdByUserId', isEqualTo: userReference)
      .orderBy('date',descending: false)
      .withConverter(
        fromFirestore: (snap, _) => TodoModelDto.fromJson(snap.data() ?? {}),
        toFirestore: (TodoModelDto model, _) => model.toJson(),
      )
      .snapshots()
      .handleError((e) {
        _logger.e(e);
        print(e);
      });
}
}

