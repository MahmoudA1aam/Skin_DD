import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/features/chatbot/data/chatbot_api.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/helper/shared_pref_helper/shared_pref.dart';

class chatbotview extends StatefulWidget {
  final String? chatbotmessage;
  const chatbotview({super.key,this.chatbotmessage});

  @override
  State<chatbotview> createState() => _chatbotviewState();
}

class _chatbotviewState extends State<chatbotview> {
  final TextEditingController chatbottextcontroller = TextEditingController();
  List<Map<String, String>> messages = [];
  chatbotapi chatapi = chatbotapi();
  final ScrollController _scrollController = ScrollController();
  bool cantyping = true;
  bool isBotTyping = false;
  Timer? typingTimer;
  String typingText = 'Typing';
  int dotCount = 0;
  bool blue = false;
  List<String> questions = [
    'What is acne?',
    'What causes eczema?',
    'How to treat acne?',
  ];

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.linear,
        );
      }
    });
  }
  void _handleSendMessage() async {
    if (chatbottextcontroller.text.trim().isNotEmpty && cantyping == true) {
      String message = '';
      setState(() {
        messages.add({'sender': 'user', 'text': chatbottextcontroller.text});
        message = chatbottextcontroller.text;
        chatbottextcontroller.clear();
        scrollToBottom();
        cantyping = false;
      });

      await Future.delayed(Duration(seconds: 1));

      isBotTyping = true;
      typingText = 'Typing';

      setState(() {
        messages.add({'sender': 'bot', 'text': typingText});
        scrollToBottom();
      });

      typingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        setState(() {
          dotCount = (dotCount + 1) % 4;
          typingText = 'Typing' + '.' * dotCount;
          messages[messages.length - 1] = {'sender': 'bot', 'text': typingText};
        });
      });

      String fullReply = await chatapi.sendMessage(message);

      typingTimer?.cancel();
      typingTimer = null;

      setState(() {
        isBotTyping = false;
        messages.removeLast();
        messages.add({'sender': 'bot', 'text': ''});
      });
      scrollToBottom();

      for (int i = 1; i <= fullReply.length; i++) {
        await Future.delayed(Duration(milliseconds: 1));
        setState(() {
          messages[messages.length - 1] = {
            'sender': 'bot',
            'text': fullReply.substring(0, i)
          };
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      }

      setState(() {
        cantyping = true;
        blue=false;
      });
    }
  }



  @override
  void initState() {
    super.initState();
    messages=[];
    if(widget.chatbotmessage!=null){
      chatbottextcontroller.text = widget.chatbotmessage!;
      _handleSendMessage();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SDD Chatbot'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit_note) ,
              onPressed: () {
                setState(() {
                  chatbottextcontroller.clear();
                  messages=[];
                  cantyping = true;
                  isBotTyping = false;
                  typingText = 'Typing';
                  dotCount = 0;
                  blue = false;
                });
              },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty?
            Center(
              child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/robot.png'),
                Text('Hi ${SharedPreferencesHelper.getDate(key: SharedPrefConstans.firstName)??''},\nHow Can I Help you Today ?',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
              ],
            ),
            )
          :Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    shrinkWrap: true,
                    itemCount: messages.length,
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      bool isUser = messages[index]['sender'] == 'user';
                      return Container(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,  //limit max width
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isUser ? Colors.blue[200] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${messages[index]['text']}',
                              softWrap: true,
                            ),
                          ),
                        ),
                      );

                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              messages.isEmpty?
              SizedBox(
                height: 45, // Adjust height based on your design
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Center(
                          child: Text(
                            questions[index],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          chatbottextcontroller.text = questions[index];
                          _handleSendMessage();
                        });
                      },
                    );
                  },
                ),
              ):Container(),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatbottextcontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          hintText: 'Talk to SDD Chatbot...',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                            if(chatbottextcontroller.text.isNotEmpty){
                              setState(() {
                                blue = true;
                              });
                            }
                            else{
                              setState(() {
                                blue=false;
                              });
                            }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          Icons.send,
                        color: cantyping&&blue?Colors.blue : Colors.grey,
                      ),
                      onPressed: _handleSendMessage
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
