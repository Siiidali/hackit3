// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StateCard extends StatelessWidget {
  StateCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.mesurement1,
      required this.mesurement2,
      required this.status,
      required this.color,
      required this.sfCartesianChart
      })
      : super(key: key);
  final String image;
  final String name;
  final String mesurement1;
  final String mesurement2;
  final String status;
  final SfCartesianChart sfCartesianChart;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width * 0.4,
      // height: 400,
      margin: EdgeInsets.only(bottom: 10,top: 10,left: 20,right: 10),
      decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,

      )],
  borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.only(left:10,right:10,top:10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(image: AssetImage(image),color:Colors.black,),
              ),
              SizedBox(
                width: 10,
              ),
              Text(name,
              style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              Text(mesurement1,style: TextStyle(fontSize: 28),),
              SizedBox(width:10),
              Text(mesurement2, style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.4),),),
            ],
          ),
          Container(
            child: Text("status"),
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.1 ,
            width: MediaQuery.of(context).size.width * 0.5,
            child: sfCartesianChart),
        ],
      ),
    );
  }
}
