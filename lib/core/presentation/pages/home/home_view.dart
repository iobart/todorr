
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.purple,
    actions: [iconButton(context)],
  ),
  floatingActionButton: speedDial(context),
  body: CustomPaint(
    painter: CurvePainter(),
    child: StreamBuilder<QuerySnapshot<TodoModelDto>>(
      stream: _homeViewModel.getTodoList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if(snapshot.data!.docs.isEmpty){
          return const Center(
            child: Text("No list"),
          );
        }
        return Container(
            padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(thickness: 1),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final doc = snapshot.data!.docs[index];
                      final TodoModelDto card = doc.data();
                      return TodoItem(card);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  ),
);

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

class TodoItem extends StatelessWidget {
  final TodoModelDto card;

 const TodoItem(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.purple,
      width: 1,
    ),
  ),
  child: ListTile(
    title: Text(
      card.title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 18),
    ),
    subtitle: Text(
      card.description.toString(),
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 16),
    ),
    trailing: _checkBox(card.state),
  ),
);

  }
}

  
Widget _checkBox(bool isCheck){
  return Checkbox(
      checkColor: Colors.white,
      tristate: isCheck,
      value: isCheck,
      onChanged: (bool? value) {
       
      
      },
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

 




