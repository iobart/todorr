import 'package:flutter/material.dart';
import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/presentation/constants/desing_constant.dart';
import 'package:todorr/core/presentation/constants/route_constant.dart';
import 'package:todorr/core/presentation/pages/login/login_view_model.dart';
import 'package:todorr/core/presentation/widgets/snackbar_alert.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel _loginViewModel;

  LoginView({super.key, required LoginViewModel? loginViewModel})
      : _loginViewModel = loginViewModel ?? locator<LoginViewModel>();

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _loginFormKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kBackground),
                // Reemplaza con la ruta de tu imagen
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _logo(),
                  const SizedBox(
                    height: 10,
                  ),
                  _title(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildEmailInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPasswordInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            kLogo,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Bienvenido!',
      style: TextStyle(
        fontSize: 50.0,
        color: Colors.white,
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      cursorColor: Colors.white,
      initialValue: _email,
      onChanged: _emailListener,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        focusColor: Colors.white,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        hintText: 'Ingrese su email',
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      cursorColor: Colors.white,
      initialValue: _password,
      minLines: 1,
      maxLines: 2,
      obscureText: false,
      obscuringCharacter: '*',
      onChanged: _passwordListener,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        focusColor: Colors.white,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        hintText: 'Ingrese su contraseña',
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su contraseña';
        }
        return null;
      },
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              _authUser();

            },
            child: const Text('Iniciar sesión'),
          ),
          ElevatedButton(
            onPressed: () {
              _registerUser();
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  ///user to the [LoginViewModel] to register the user.
  Future<void> _registerUser() async {
    _hideKeyboard();
    if (_loginFormKey.currentState!.validate()) {
      final bool isUserRegister =
          await widget._loginViewModel.registerUser(_email, _password);
      isUserRegister ? _handleSuccesCreation() : _handleFailedLogIn();
    } else {
      _handleFailedLogIn();
    }
  }

  ///user to the [LoginViewModel] to auth the user.
  void _authUser() async {
    _hideKeyboard();
    if (_loginFormKey.currentState!.validate()) {
      final UserModel? loggedIn =
          await widget._loginViewModel.loginUser(_email, _password);
      if (loggedIn != null) {
        _handleSuccessLogIn();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Iniciando sesión...')),
        );
      } else {
        _handleFailedLogIn();
      }
    }
  }

  void _handleSuccesCreation() {
    SnackBarFloating.show(
      context,
      'Usuario creado correctamente',
      type: TypeAlert.success,
    );
  }

  void _handleFailedLogIn() {
    SnackBarFloating.show(
      context,
      'Usuario o contraseña incorrectos',
      type: TypeAlert.error,
    );
  }

  /// Listens the changes of the password custom text field value[email].
  /// Assigns it to a local variable[_password].
  void _passwordListener(String password) {
    _password = password;
  }

  /// Listens the changes of the email custom text field value[email].
  /// Assigns it to a local variable[_email]
  void _emailListener(String email) {
    _email = email.trim();
  }

  /// Handles the success login logic
  void _handleSuccessLogIn() {
    Navigator.pushReplacementNamed(context, homeRoute);
  }

  ///Hide the keyboard if showed
  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
