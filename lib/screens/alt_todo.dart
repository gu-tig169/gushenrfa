import 'package:flutter/material.dart';
import 'package:gushenrfa/cards.dart';

class AltTodoScreen extends StatefulWidget {
  AltTodoScreen(this.cardManager);

  final String title = 'The cool Todool';
  final CardManager cardManager;

  @override
  _AltTodoScreenState createState() => _AltTodoScreenState();
}

class _AltTodoScreenState extends State<AltTodoScreen> {

  void _onAddButtonPressed() {
    widget.cardManager.addCard('title');
  }

  void _onSortButtonPressed() {
    print('Sort button pressed (not functional)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Image.asset('assets/images/wooden_background.jpeg',
            fit: BoxFit.fill)
          ),
          Column(
            children: [
              
              //En go appbar
              AppBar(
                title: Text(
                  widget.title, 
                  style: TextStyle(color: Color(0xFFFAFAFA))
                ),
                backgroundColor: Colors.blueGrey.withOpacity(0.3),
              ),
              
              //Inputfält för Todo (TodoCard.title)
              Container(
                padding: EdgeInsets.only(top: 100.0, left: 24.0, right: 24.0),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "What to do?", 
                      hintStyle: TextStyle(color: Theme.of(context).hintColor)),
                      style: TextStyle(
                        color: Color(0xFFFAFAFA),
                        fontWeight: FontWeight.bold
                      ),
                  ),

                  //Add button
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: _onAddButtonPressed,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Color(0xFF658E5B),
                    ),
                  ),

                ]),
              ),
            ]
          ),
          
          //Dragbart sheet att stoppa Todo-listan i
          DraggableScrollableSheet(
            maxChildSize: 0.88,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFedeae4),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
                ),
                child: Stack(
                  children: [

                    //Lista med Todo-kort
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemBuilder: (context, index) => widget.cardManager.getCards()[index],
                        itemCount: widget.cardManager.todoCards.length,
                        controller: scrollController,
                      ),
                    ),

                    //Filterknapp med gradiant (går inte att använda detta fält för att röra sheet upp eller ner)
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 10.0),
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFedeae4), Color(0x0Fedeae4)], 
                          begin: Alignment.topCenter, 
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1.0]
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            onPressed: null,  
                            child: Icon(Icons.refresh)),
                          FlatButton(
                            onPressed: _onSortButtonPressed,
                            color: Colors.transparent,
                            child: Icon(Icons.sort, size: 36,)
                          ),
                        ]
                      )
                    ),
                    
                  ]
                )
              );
            },
          )
        ],
      )
    );
  }
}