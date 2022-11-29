import 'package:flutter/material.dart';
import 'second_screen.dart';

void main(){runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
        home: FirstScreen());
  }
}


List<String> eats = <String>['Молоко', 'Сметана', 'Мясо', 'Колбаса','Корм','Творог','Другое'];
List<String> toys=<String>['0','1','2','3','4','5','больше 5'];

//-------1я страница-------//
class FirstScreen extends StatefulWidget{
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen>{
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String _name="";
  String _wish="";
  int _gender = 0;
  String _dropdownEat = eats.first;
  String _dropdownToy=toys.first;
  bool _isChecked = false;

  final wishController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    wishController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Регистрация на тусовку котиков'),
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
            backgroundColor: Colors.amber
        ),

        body: Form(
          key: _form,
          child: Column(children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 35.0, left: 25.0),
                child: Row(children:const <Widget>[
                  Text('Твоя кличка:', style: TextStyle(fontSize: 20.0)),
                ])
            ),

            Padding(padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Василий Мурзилкин',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуста, введи свою кличку';
                      }
                      return null;
                    })
            ),

            Padding(padding: const EdgeInsets.only(top: 20.0, left: 25.0),
                child: Row(children: <Widget>[
                  const Text('Твой пол:', style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    width: 178,
                    child: Expanded(
                      flex: 1,
                      child: RadioListTile(
                        title: const Text('Женский', style: TextStyle(fontSize: 20.0)),
                        activeColor: Colors.amber,
                        value: 0,
                        groupValue: _gender,
                        onChanged: (int? value){
                          setState(() {
                            _gender=value!;
                          });
                        }
                      )
                    )
                  ),
                  SizedBox(
                    width: 178,
                    child: Expanded(
                      flex: 1,
                      child: RadioListTile(
                        title: const Text('Мужской', style: TextStyle(fontSize: 20.0)),
                        activeColor: Colors.amber,
                        value: 1,
                        groupValue: _gender,
                        onChanged: (int? value){
                          setState(() {
                            _gender=value!;
                          });
                        })
                    )
                  )
                ])
            ),

            Padding(padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                child: Row(children: <Widget>[
                  const Text('Любимое блюдо:   ', style: TextStyle(fontSize: 20.0)),
                  DropdownButton(
                    value: _dropdownEat,
                    underline: Container(
                      height: 2,
                      color: Colors.amber
                    ),
                    dropdownColor: Colors.amber,
                    items: eats.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 20.0))
                      );
                    }).toList(),
                    onChanged: (String? value){
                      setState(() {
                        _dropdownEat=value!;
                      });
                      })
                ])
            ),

            Padding(padding: const EdgeInsets.only(top: 15.0, left: 18.0),
                child: Row(children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor:Colors.amber,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                      }),
                  const Text('  Мне нужна когтеточка',style: TextStyle(fontSize: 20.0)),
                ])
            ),

            Padding(padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                child: Row(children: <Widget>[
                  const Text('Количество игрушек с собой:   ', style: TextStyle(fontSize: 20.0)),
                  DropdownButton(
                    value: _dropdownToy,
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    dropdownColor: Colors.amber,
                    items: toys.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 20.0))
                      );
                    }).toList(),
                    onChanged: (String? value){
                      setState(() {
                        _dropdownToy=value!;
                      });
                    }
                  )
                ])
            ),

            Padding(padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                child: Row(children: const <Widget>[
                  Text('Твои пожелания:   ', style: TextStyle(fontSize: 20.0))
                ])
            ),

            Padding(padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 35.0, top: 10.0),
                child: TextFormField(
                  controller: wishController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Хочу Котобаскова и домашнюю сметану',
                  )
                )
            ),

            ElevatedButton(onPressed: (){
              if(_form.currentState!.validate()){
                _name=nameController.text;
                _wish=wishController.text;
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context)=> SecondScreen(
                            name:_name,
                            gender:_gender,
                            dropdownEat:_dropdownEat,
                            isChecked:_isChecked,
                            dropdownToy:_dropdownToy,
                            wish:_wish)
                    )
                );
              }},
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                child: const Text('Зарегистрироваться',style: TextStyle(fontSize: 18))
            )
          ])
      )
    );
  }
}