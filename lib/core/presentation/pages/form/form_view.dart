import 'package:flutter/material.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/presentation/constants/route_constant.dart';
import 'package:todorr/core/presentation/pages/form/form_view_model.dart';
import 'package:todorr/core/presentation/utils/curve_painter.dart';


class FormView extends StatelessWidget {
  final FormViewModel _formViewModel;

  FormView({Key? key, FormViewModel? formViewModel})
      : _formViewModel = formViewModel ?? locator<FormViewModel>();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
       leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed:()=> Navigator.pop(context)),
        title: const Text('Formulario',style: TextStyle(color: Colors.white),),
      ),
      body: Form(
        key: _formKey,


        child: CustomPaint(
          painter:CurvePainter() ,
          child: Container(
            padding:const EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 _inputTitle(),
                 const SizedBox(height: 20,),
                  _inputDescription(),
                   const SizedBox(height: 20,),
                  ElevatedButton(
                    child: const Text('Crear'),
                    onPressed: () {
                      navigateIfFormValid(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateIfFormValid(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    final b = await _formViewModel.submitForm();
    if (b) {
      Navigator.pushNamed(context, homeRoute);
    }
  }
}

  Widget _inputTitle(){
    return  TextFormField(
                  controller: _formViewModel.titleController,
                  decoration:const  InputDecoration(labelText: 'Título',
                   enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
                  ),
                );
  }


  Widget _inputDescription(){
   return TextFormField(
     controller: _formViewModel.descriptionController,
                  decoration: const InputDecoration(labelText: 'Descripción',  enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ))
                );
  }
}
