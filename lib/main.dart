import 'package:first/hard.dart';
import 'package:first/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: first(),
  debugShowCheckedModeBanner: false,));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          title: Text("Select mode"),
          actions: [
            PopupMenuButton(itemBuilder: (context) => [
              PopupMenuItem(child: Text("SHARE")),
              PopupMenuItem(child: Text("MORE GAMES")),
              PopupMenuItem(child: Text("PRIVACY POLICY"))
            ])
          ],
        ),

        body: Column(children: [
          Expanded(child: Container(
            height: 800,
            width: double.infinity,

            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("pic/img.jpg"),fit: BoxFit.fill)
            ),

//-----------------------------------------------------------------------------------------------------------------

            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 160),
                height: 280,
                width: 220,

                decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    border: Border.all(width: 4,color: Colors.teal.shade600),
                    borderRadius: BorderRadius.circular(15)
                ),
//-----------------------------------------------------------------------------------------------------------------
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:() {

                        Navigator.push(context,  MaterialPageRoute(builder: (context) {
                          return second();
                        },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 180,
                        color: Colors.teal.shade600,
                        child: Text("NO TIME LIMIT",style: TextStyle(fontSize: 22,color: Colors.white),),
                      ),
                    ),

//-----------------------------------------------------------------------------------------------------------------

                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 180,
                      color: Colors.teal.shade600,
                      child: Text("NORMAL",style: TextStyle(fontSize: 22,color: Colors.white)),
                    ),

//-----------------------------------------------------------------------------------------------------------------

                    InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return hard();
                        },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 180,
                        color: Colors.teal.shade600,
                        child: Text("HARD",style: TextStyle(fontSize: 22,color: Colors.white)),
                      ),
                    )
                  ],),
              ),

//-----------------------------------------------------------------------------------------------------------------

              Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 70,
                  width: 170,

                  decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      border: Border.all(width: 3,color: Colors.teal.shade600),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 140,
                        color: Colors.teal.shade600,
                        child: Text("REMOVE ADS",style: TextStyle(fontSize: 16,color: Colors.white),),
                      ),
                    ],)
              ),

//-----------------------------------------------------------------------------------------------------------------

              Container(
                margin: EdgeInsets.only(top: 30),
                height: 70,
                width: 350,

                decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    border: Border.all(width: 3,color: Colors.teal.shade600),
                    borderRadius: BorderRadius.circular(15)
                ),

//-----------------------------------------------------------------------------------------------------------------
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 140,
                      color: Colors.teal.shade600,
                      child: Text("SHARE",style: TextStyle(fontSize: 18,color: Colors.white)),
                    ),

//-----------------------------------------------------------------------------------------------------------------

                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 140,
                      color: Colors.teal.shade600,
                      child: Text("MORE GAME",style: TextStyle(fontSize: 18,color: Colors.white),),
                    )
                  ],),
              ),

            ],),
          ),
          ),

//-----------------------------------------------------------------------------------------------------------------
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.teal.shade600,
          )
        ],)


    );
  }
}
