import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class game8 extends StatefulWidget {
  const game8({super.key});

  @override
  State<game8> createState() => _game8State();
}

class _game8State extends State<game8> {

  List images=[];
  List img=[];
  int a=10;
  int b=0;
  List <bool> temp = [];
  int x=1;
  int pos1=0,pos2=0;

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
      for(int i = 0; i < 20 ; i++)
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
    temp=List.filled(40, true);
    get();
  }

  get()
  async {
    for(int i = 10 ; i >= 0 ; i--)
    {
      await Future.delayed(Duration(seconds: 1));
      a=i;
      if(i == 0) temp=List.filled(40, false);
      setState(() {

      });

    }

    for(int j = 0 ; j <= 1000 ; j++)
    {
      await Future.delayed(Duration(seconds: 1));
      b=j;
      setState(() {

      });;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Time : ${a}/${b}""\t\t\t\tNo Time Limit",style: TextStyle(fontSize: 18),),
        backgroundColor: Colors.teal.shade600,
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
          height: double.infinity,
          width: double.infinity,
          color: Colors.teal.shade50,

          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 30,bottom: 20),
              height: 5,
              width: double.infinity,
              color: Colors.black26,
            ),

            Expanded(child: GridView.builder(
              itemCount: img.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemBuilder: (context, index) {

                return Visibility(child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
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
                          }

                          else{
                            Future.delayed(Duration(seconds: 1)).then((value) {
                              temp[pos1]=false;
                              temp[pos2]=false;

                              setState(() {

                              });
                            },);
                          }
                        }
                        setState(() {

                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
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
