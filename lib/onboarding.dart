import 'package:flutter/material.dart';
import 'package:onboard/const.dart';

class Onboarding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffECF8FF),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int index = 0;
  List<Map> data = [
    {
      "image" : "assets/img-1.png",
      "title" : "Let us take care of you",
      "desc" : "We are here to take care of you\nwith pleasure. besides that we will\nmonitor your condition 24/Day"
    },
    {
      "image" : "assets/img-2.png",
      "title" : "Always use a mask",
      "desc" : "always use a mask when you want\nto travel and keep your\nbody immunity"
    },
    {
      "image" : "assets/img-3.png",
      "title" : "Work from home",
      "desc" : "Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod."
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    indicator(){
      return Container(
        width: 12,
        height: 4,
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: Color(0xffCBD6F3),
          borderRadius: BorderRadius.circular(100)
        )
      );
    }

    activeIndicator(){
      return Container(
        width: 18,
        height: 4,
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: Color(0xff6686D8),
          borderRadius: BorderRadius.circular(100)
        )
      );
    }

    return Stack(
       children: [
         Padding(
           padding: EdgeInsets.only(top: 30, right: 30, left: 30),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               index == 0 ? Container() : InkWell(
                 child: Icon(Icons.chevron_left),
                 onTap: (){
                   setState(() {
                     index -=1;
                   });
                 },),
               Text('Skip', style: mediumText,)
             ],
           ),
         ),
         Column(
           children: [
             SizedBox(height: 120,),
             Positioned(left: 0,child: Image.asset(data[index]["image"],  height: (548.55/812)*screenHeight,))
           ],
         ),
         Positioned(
           bottom: 0,
           child: Container(
             width: screenWidth,
             height: (290/812)*screenHeight,
             decoration: BoxDecoration(
               color: Color(0xffFFFFFF),
               borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
             ),
             child: Padding(
               padding: const EdgeInsets.all(30),
               child: Column(
                 children: [
                   Text(data[index]["title"], style: boldText,),
                   SizedBox(height: 20,),
                   Text(data[index]["desc"], style: regularText, textAlign: TextAlign.center,),
                   SizedBox(height: 50,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [0,1,2].map((item){
                          if(index == item) return activeIndicator();
                           return indicator();
                         }).toList(),
                       ),
                       InkWell(
                         child: Image.asset('assets/btn-next.png', width: (40/375)*screenWidth, height: (40/812)*screenHeight,),
                         onTap: (){
                           setState(() {
                             index == 2 ? index = 0 : index +=1;
                           });
                         },
                        )
                     ],
                   )
                 ],
               ),
             ),
           ),
         )
       ]
    );
  }
}