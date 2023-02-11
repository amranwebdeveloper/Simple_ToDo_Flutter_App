import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Style.dart';

class  ToDoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();
  }
}

class ToDoPageView extends State<ToDoPage> {

  List ToDoList = [];
  String item = "";
  String time = "";

  MyInputOnChnage(content){
    setState(() {
      item=content;
    });
  }
  MyInput2OnChnage(schedule){
    setState(() {
      time=schedule;
    });
  }
  AddItem(){
    setState((){
      ToDoList.add({'item':item,'time':time});
    });
  }
  RemoveItem(index){
    setState((){
      ToDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded( flex: 55, child: TextFormField( onChanged: (content){ MyInputOnChnage(content); }, decoration: AppInputDecoration("My Work"),)),
                    Expanded( flex: 30, child: TextFormField( onChanged: (schedule){ MyInput2OnChnage(schedule); }, decoration: AppInputDecoration("Time"),)),
                    Expanded( flex: 15, child: Padding(padding: EdgeInsets.only(left: 5), child: ElevatedButton(onPressed: (){ AddItem();}, child: Icon(Icons.add),style: AppButtonStyle(),) )),
                  ],
                )
            ),
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: ToDoList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: SizeBox50(
                          Row(
                            children: [
                              Expanded( flex: 55, child: Text(ToDoList[index]['item'].toString())),
                              Expanded( flex: 30, child: Text(ToDoList[index]['time'].toString())),
                              Expanded( flex: 15, child: TextButton(onPressed: (){RemoveItem(index);}, child: Icon(Icons.delete)) ),
                            ],
                          )
                        ),
                      );
                    }
                )
            ),
          ],
        ),
      )
    );
  }
}
