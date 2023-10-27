import 'package:first/hard1.dart';
import 'package:flutter/material.dart';

class hard extends StatefulWidget {

  @override
  State<hard> createState() => _hardState();
}

class _hardState extends State<hard> {

  List name=["Match 1","Match 2","Match 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Text("Select level""\t\tNO TIME LIMIT",style: TextStyle(fontSize: 18),),

        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text("SOUND OFF")),
            PopupMenuItem(child: Text("SHARE")),
            PopupMenuItem(child: Text("MORE GAMES")),
            PopupMenuItem(child: Text("PRIVACY POLICY")),
          ])
        ],
      ),

      body: Column(children: [
        Expanded(child: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("pic/img.jpg"),fit: BoxFit.fill)
          ),

//----------------------------------------------------------------------------------------------------------------

          child: ListView.builder(
            itemCount: name.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, myindex) {
              return Container(
                margin: EdgeInsets.only(left: 50,right: 50,top: 40,bottom: 40),
                height: 300,
                width: 200,

                decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    border: Border.all(width: 4,color: Colors.teal.shade600),
                    borderRadius: BorderRadius.circular(15)),

//----------------------------------------------------------------------------------------------------------------
                child: Column(children: [
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 15),
                      alignment: Alignment.center,
                      height: 60,
                      width: 100,
                      child: Text("${name[myindex]}",style: TextStyle(fontSize: 24,color: Colors.teal.shade600,
                          fontWeight: FontWeight.bold),),
                    ),
                    Icon(Icons.help,size: 30,color: Colors.teal.shade600,),
                  ],),

//----------------------------------------------------------------------------------------------------------------
                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5),
                    height: 3,
                    width: 170,
                    color: Colors.black45,
                  ),

//----------------------------------------------------------------------------------------------------------------
                  Expanded(child: Container(
                      height: double.infinity,
                      width: double.infinity,

                      child: ListView.builder(
                        itemCount :10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return hard1((myindex * 10) + index);
                              },));
                            },

                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5),
                              height: 50,
                              width: 100,
                              color: Colors.teal.shade600,
                              child: Text("LEVEL ${(myindex*10)+index+1}",style: TextStyle(fontSize: 20,
                                  color: Colors.white),),
                            ),
                          );
                        },)

                  ))
                ],),
              );
            },),
        ),),

//----------------------------------------------------------------------------------------------------------------
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.teal.shade600,
        )
      ],),

    );
  }
}
