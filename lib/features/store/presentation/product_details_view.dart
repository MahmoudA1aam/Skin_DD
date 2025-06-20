import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/features/chatbot/presentation/ui/chatbot_view.dart';

import '../../../core/helper/routes/routes_name.dart';
import '../data/medicines_api.dart';

class productdetailsview extends StatelessWidget {
  final Medicine? medicine_data;
  const productdetailsview({super.key,this.medicine_data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Medicine Details',style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      constraints: BoxConstraints(
                        minHeight: 300,
                      ),
                      width: double.infinity,
                      child:
                      Image.network(
                        medicine_data?.imageUrl??'',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            // Image has finished loading
                            return child;
                          } else {
                            // Display a CircularProgressIndicator while loading
                            return Center(
                              child: CircularProgressIndicator()
                            );
                          }
                        },
                      ),
                    ),
                    Text('Medicine Name',style: TextStyle(fontSize: 20),),
                    Text('${medicine_data?.name}'),
                    Text('Description',style: TextStyle(fontSize: 20),),
                    Text('${medicine_data?.description}'),
                    Text('How To Use',style: TextStyle(fontSize: 20),),
                    Text('${medicine_data?.use}'),

                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.only(top: 13,bottom: 13),
            color: Colors.blue,
            child: Container(width: double.infinity,child: Text('Talk To Chatbot For Details',style: TextStyle( fontSize: 15,color: Colors.white),textAlign: TextAlign.center,)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chatbotview(chatbotmessage: 'Tell me details about ${medicine_data?.name} Medicine',),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
