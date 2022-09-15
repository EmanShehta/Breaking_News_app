import 'package:flutter/material.dart';
import 'package:news_app/new_layout.dart';
import 'package:percent_indicator/percent_indicator.dart';



//This is splash screen
class SplashScreen extends StatelessWidget
{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          //img logo
          Image(image: AssetImage("assests/new.jpg"), fit:BoxFit.fill,),

          //LinearPercentIndicator
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: Colors.redAccent,
              onAnimationEnd: ()
              {
               Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => news_layout(),
                  ),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
