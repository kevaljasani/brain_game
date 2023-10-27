import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class hard3 extends StatefulWidget {
  const hard3({super.key});

  @override
  State<hard3> createState() => _hard3State();
}

class _hard3State extends State<hard3> {

  List images1=[];
  List img1=[];
  int a=6;
  int b=0;
  List <bool> temp1 = [];
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
      images1 = imagePaths;
      images1.shuffle();
      for(int i = 0 ; i < 8 ; i++)
      {
        img1.add(images1[i]);
        img1.add(images1[i]);
      }
      img1.shuffle();
    });
  }

  @override
  void initState() {

    _initImages();
    temp1=List.filled(16, true);

    get();
  }

  get()
  async {

    for(int i = 6 ; i >= 0 ; i--)
    {
      await Future.delayed(Duration(seconds: 1));
      a=i;
      if(i==0) temp1=List.filled(16, false);
      setState(() {

      });
    }

    for(int j = 0 ; j <= 5 ; j ++)
    {
      await Future.delayed(Duration(seconds: 1));
      b=j;
      setState(() {

      });
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
              margin: EdgeInsets.only(top: 50,bottom: 100),
              height: 5,
              width: double.infinity,
              color: Colors.black26,
            ),

            Expanded(child: GridView.builder(
              itemCount: img1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
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
                    child: Image.asset("${img1[index]}")),

                    visible: temp1[index],
                    replacement: InkWell(
                      onTap: () {

                        if(!temp1[index] && x==1)
                        {
                          temp1[index]=true;
                          x=2;
                          pos1=index;
                        }

                        if(!temp1[index] && x==2)
                        {
                          temp1[index]=true;
                          x=1;
                          pos2=index;

                          if(img1[pos1] == img1[pos2])
                          {
                            Text(" IMAGE IS MATCH",style: TextStyle(fontSize: 20,color: Colors.black),);
                            int k=b+5;
                            //j=k;
                          }

                          else{
                            Future.delayed(Duration(seconds: 1)).then((value) {
                              temp1[pos1]=false;
                              temp1[pos2]=false;

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
