import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/routes/routes_name.dart';

class navigatechatbot extends StatelessWidget {
  const navigatechatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100, //120
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/chatbot.jpg',fit: BoxFit.cover,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text('Talk To Chatbot',style: TextStyle(color: Colors.white,fontSize:  22 ,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(CupertinoIcons.arrow_right_circle,size: 45),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.chatbotview,
                        );
                      },),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
