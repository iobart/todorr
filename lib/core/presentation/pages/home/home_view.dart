
import 'package:flutter/material.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/presentation/constants/route_constant.dart';
import 'package:todorr/core/presentation/pages/home/home_view_model.dart';
import 'package:todorr/core/presentation/utils/curve_painter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeView extends StatelessWidget {
   final HomeViewModel _homeViewModel;
   HomeView({Key? key, HomeViewModel? homeViewModel,}): _homeViewModel = homeViewModel ?? locator<HomeViewModel>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    _homeViewModel.userInfo;
    return Scaffold(
  
      appBar: AppBar(
        backgroundColor: Colors.purple,
       leading:  IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () {
              // Acción del botón izquierdo
            },
          ),
        actions: [iconButton(context)]),
        floatingActionButton:speedDial(context) ,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(),
      ),
    );
  }

Widget speedDial(BuildContext context){
  return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0,color: Colors.white),
      backgroundColor: Colors.purple,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.list_alt_rounded,color: Colors.black,),
          label: 'Crear Tarea',
          onTap: () {
          Navigator.pushNamed(context, formRoute);
          },
        ),
      ],);
}

   Widget iconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout,color: Colors.white),
      onPressed: () {
        _homeViewModel.logout();
        Navigator.pushNamed(context, loginRoute);
      },
    );
  }
}



