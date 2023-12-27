import 'package:flutter/material.dart';
import 'package:todorr/core/presentation/constants/desing_constant.dart';
import 'package:todorr/core/presentation/constants/route_constant.dart';
import 'package:todorr/core/presentation/pages/home/home_view.dart';
import 'package:todorr/core/presentation/pages/home/home_view_model.dart';
import 'package:todorr/core/presentation/pages/login/login_view.dart';
import 'package:todorr/core/presentation/pages/login/login_view_model.dart';
import 'package:todorr/core/presentation/utils/image_utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        final LoginViewModel viewModel = settings.arguments != null
            ? settings.arguments as LoginViewModel
            : LoginViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginView(
                  loginViewModel: viewModel,
                ));
      case homeRoute:
        final HomeViewModel viewModel = settings.arguments != null
            ? settings.arguments as HomeViewModel
            : HomeViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeView(
              homeViewModel: viewModel,
            ));
      default:
  return MaterialPageRoute(
  builder: (BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getLottieFromJson(
              fit: BoxFit.contain, height: 300, lottie: kWrongRoute),
         const SizedBox(height: 20,),
          ElevatedButton(
            onPressed:(){Navigator.popAndPushNamed(context,loginRoute);},
            child: Text('Volver'),
          ),
        ],
      ),
    ), 
  ),
);


    }
  }
}
