import 'dart:convert';
import 'package:first/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  runApp(MaterialApp(home: hard4(),));
}
class hard4 extends StatefulWidget {

  @override
  State<hard4> createState() => _hard4State();
}

class _hard4State extends State<hard4> {

  List images=[];
  List img=[];
  int a=5;
  int b=0;
  int c=5;
  late int j=5;
  List <bool> temp = [];
  int x=1;
  int pos1=0,pos2=0;
  Color col=Colors.orange;

  @override

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('pic/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      images = imagePaths;
      images.shuffle();
      for(int i = 0 ; i < 6 ; i++)
      {
        img.add(images[i]);
        img.add(images[i]);
      }
      img.shuffle();
    });
  }

  @override
  void initState() {

    _initImages();
    temp=List.filled(12, true);
    get();

  }

  get()
  async {

    for(int i = 5 ; i >= 0 ; i--)
    {

      await Future.delayed(Duration(seconds: 1));
      a=i;
      if(i == 0) temp=List.filled(12, false);
      setState(() {

      });
    }

//-----------------------------------------------------------------------------------------------------------
    for(j = 0 ; j <= 5 ; j ++)
    {

      await Future.delayed(Duration(seconds: 1));
      b=j;
      b==b;

      if( b == c)
      {
//           showDialog(
//             barrierColor: Colors.transparent,
//             barrierDismissible: false,
//             context: context, builder: (context) {
//             return AlertDialog(
//               title: Text("TIME OUT",style: TextStyle(fontSize: 20),),
//               content: Text("TRY AGAIN ?",style: TextStyle(fontSize: 15),),
//               actions: [
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                      Container(
//                        height: 30,
//                        width: 70,
//                        color: Colors.teal.shade600,
//                        child: TextButton(onPressed: () {
//
//                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
//                          //   return second();
//                          // },));
//
//                        }, child: Text("Cancel",style: TextStyle(fontSize: 15,color: Colors.white),)),
//                      ),
//
// //------------------------------------------------------------------------------------------------------------
//                     Container(
//                         height: 30,
//                         width: 70,
//                         color: Colors.teal.shade600,
//                         child: TextButton(onPressed: () {
//
//                           // Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //   return hard1();
//                           // },));
//
//                         }, child: Text("Ok",style: TextStyle(fontSize: 15,color: Colors.white),)),
//                       ),
//                   ],
//                 )
//               ],
//             );
//           },);

      }
      setState(() {

      });
    }

  }


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Time : ${(a)/(b)}/${b}""\t\t\t\tNo Time Limit",style: TextStyle(fontSize: 18),),
        backgroundColor: Colors.teal.shade600,
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text("SHARE")),
            PopupMenuItem(child: Text("MORE GAMES")),
            PopupMenuItem(child: Text("PRIVACY POLICY"))
          ])
        ],
      ),

//-----------------------------------------------------------------------------------------------------------

      body: Column(children: [
        Expanded(child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.teal.shade50,

          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 50,bottom: 50),
              height: 5,
              width: 450,

              decoration: BoxDecoration(
                color:(j == 0) ? (Colors.orange ) : Colors.black45,
              ),
            ),

//-----------------------------------------------------------------------------------------------------------

            Expanded(child: GridView.builder(
              itemCount: img.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemBuilder: (context, index) {

                return Visibility(child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 70,
                    width: 50,

                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Image.asset("${img[index]}")),

                    visible: temp[index],
                    replacement: InkWell(
                      onTap: () {

                        if(!temp[index] && x==1)
                        {
                          temp[index]=true;
                          x=2;
                          pos1=index;
                        }

                        if(!temp[index] && x==2)
                        {
                          temp[index]=true;
                          x=1;
                          pos2=index;

                          if(img[pos1] == img[pos2])
                          {
                            Text(" IMAGE IS MATCH",style: TextStyle(fontSize: 20,color: Colors.black),);
                            int k=b+5;
                            b=k;
                            setState(() {

                            });
                          }

                          else{
                            Future.delayed(Duration(milliseconds: 500)).then((value) {
                              temp[pos1]=false;
                              temp[pos2]=false;

                              setState(() {

                              });
                            },);
                          }}

                        setState(() {

                        });
                      },

//-----------------------------------------------------------------------------------------------------------

                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 70,
                        width: 50,

                        decoration: BoxDecoration(
                            color: Colors.teal.shade600,
                            border: Border.all(width: 2,color: Colors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    )
                );
              },)),

//-----------------------------------------------------------------------------------------------------------
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.teal.shade600,
            ),

          ]),
        ),
        ),
      ]),
    );
  }
}