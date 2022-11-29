import 'package:flutter/material.dart';

//-------2я страница-------//
class SecondScreen extends StatelessWidget{
  const SecondScreen(
      {super.key,
        required this.name,
        this.gender,
        this.dropdownEat,
        this.isChecked,
        this.dropdownToy,
        this.wish
      });

  final String? name;
  final int? gender;
  final String? dropdownEat;
  final bool? isChecked;
  final String? dropdownToy;
  final String? wish;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Круто! Мы ждём тебя!'),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.amber),

      body: Column(children: <Widget>[
        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Кличка:  ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.only(right: 25.0, top: 35.0),
            child: Text('$name', style: const TextStyle(fontSize: 20.0)),
          )
        ]),

        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Пол:  ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 25.0, top: 35.0),
              child: Text(gender == 0 ? "Женский" : "Мужской",style: const TextStyle(fontSize: 20.0))
            //  context.watch<All>().getGender, style: const TextStyle(fontSize: 20.0)),
          )
        ]),

        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Любимое блюдо:   ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 25.0, top: 35.0),
              child: Text('$dropdownEat', style: const TextStyle(fontSize: 20.0))
            //  context.watch<All>().getGender, style: const TextStyle(fontSize: 20.0)),
          )
        ]),

        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Когтеточка:   ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 25.0, top: 35.0),
              child: Text(isChecked == true ? "нужна" : "не нужна", style: const TextStyle(fontSize: 20.0))
          )
        ]),

        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Количество игрушек с собой:   ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 25.0, top: 35.0),
              child: Text('$dropdownToy', style: const TextStyle(fontSize: 20.0))
            //  context.watch<All>().getGender, style: const TextStyle(fontSize: 20.0)),
          )
        ]),

        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: const Text('Пожелания:   ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 25.0, top: 35.0),
              child: Text('$wish', style: const TextStyle(fontSize: 20.0))
            //  context.watch<All>().getGender, style: const TextStyle(fontSize: 20.0)),
          )
        ]),
      ]),
    );
  }
}