

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}


class _DropDownListState extends State<DropDownList> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          height: 70,
          width: 150,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("DropDownListButton"),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward,color: Colors.blue,),
                iconSize: 24,
                elevation: 16,
                // style: const TextStyle(color: Colors.blue),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(color: Colors.blue),),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        
      ),
    ));
  }
}
