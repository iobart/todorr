import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/data/dtos/user_model_dto.dart';

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

 Future<void> addTodo(TodoModelDto todoModel) async {
  User? user = _auth.currentUser;
  try{
  if (user != null) {
    return _todoCollection.doc(user.uid).set({
      'title': todoModel.title,
      'description': todoModel.description,
      'state': todoModel.state,
      'date': todoModel.date,
    });
  } else {
    throw Exception('No user logged in');
  } }
  catch (e){
     _logger.e(e);
  }
}
}
