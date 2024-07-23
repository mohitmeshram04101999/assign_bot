

import 'dart:convert';

import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/chat_controllers/fetch_message_api.dart';
import 'package:assignbot/models/message_list_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:assignbot/widgets/custom_textfield_decoration.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';




class ChattingPage extends StatefulWidget {

  final dynamic userId;
  const ChattingPage({super.key,required this.userId});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  late final  chatController = Provider.of<MessageController>(context,listen: false);
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _showEmojiPicker = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chatController.clear();
  }

  void _sendMessage() {
    String message = _messageController.text;
    _messageController.text="";
    if (message.isNotEmpty) {
      chatController.sendMessage(widget.userId, message);
    }
  }





  Future<void> _selectAndSendFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        setState(() {
          _messages.add({
            'text': '',
            'image': filePath,
            'sender': 'user',
            'time': DateTime.now(),
            'seen': false,
          });
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  Widget _buildMessage(Message messageData,dynamic currentUserId) {
    String message = messageData.body??'';
    // String imagePath = messageData.ava ?? '';
    int sender = messageData.toId;
    DateTime time = messageData.createdAt;
    // bool seen = messageData['seen'];
    bool isUser = sender == currentUserId;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? Color.fromRGBO(254, 217, 87, 1) : Color.fromRGBO(252, 239, 192, 1),
          borderRadius: BorderRadius.only(
            topRight: isUser ? Radius.zero : Radius.circular(20),
            topLeft: isUser ? Radius.circular(20) : Radius.circular(20),
            bottomRight: isUser ? Radius.circular(20) : Radius.circular(20),
            bottomLeft: isUser ? Radius.circular(20) : Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.isNotEmpty)
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            // if (imagePath.isNotEmpty)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 8.0),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Image.file(
            //
            //         File(imagePath),
            //
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // SizedBox(height: 4.0),
            // if (isUser)
              // Icon(
              //   seen ? Icons.check_circle : Icons.check_circle_outline,
              //   size: 16,
              //   color: seen ? Colors.blue : Colors.grey,
              // ),
            Text(
              DateFormat('hh:mm a').format(time),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
  FetchMessageApi fetchMessageApi= FetchMessageApi();
  UserPrefModel? userData ;
  getId()async{
  UserPreference userPreference = UserPreference();
  userData= await userPreference.getUser();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    loadPusher();
  }


  Future<void> loadPusher() async
  {
    var user = await UserPreference().getUser();

    await pusher.init(
      apiKey: "49531b3cef3b6772a349",
      cluster: "ap2",
      onSubscriptionSucceeded:onSub,
      onEvent: onEevent,
    );

    await pusher.subscribe(channelName: "${user.userId}_${widget.userId}");
    print("${user.userId}_${widget.userId}");
    await pusher.connect();



  }

  onEevent(PusherEvent event) {
    print("Pusher Event");
    print("WhT IA EVENT nAMW = ");
    print(event);

    if(event.eventName == "receive")
    {
      print( "My Event event ${event.eventName}");
      print(event.data);

      var _data = jsonDecode(event.data);
      chatController.addNewMessage(Message(
        body: _data["message"],
        attachment: _data["file"],
        createdAt: DateTime.now(),
        fromId: widget.userId,
        toId: userData?.userId??0,
        id: _data["id"],
        type: _data["type"],
        seen: 0,
        updatedAt: DateTime.now()
      ));
    }
  }

  onSub (String s,dynamic d)
  {
    print("Pusher channel is Subscibed suks");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              onTap: () {
                // _showLogoutDialog();
              },
              child:  Container(
                width: SC.fromContextWidth(context, 11),
                child: Image.asset('assets/log.png'),
              ),
            ),
          )
        ],
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title:  Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Text(
            'Chat ${widget.userId}',
            style:const  TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: const Color(0xFFF60205),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: chatController.fetchmessageapi(widget.userId),
              builder: (context, snapshot) {

                return Consumer<MessageController>(builder: (a,p,c){

                  if(p.messages.isNotEmpty){
                    List messages = p.messages;

                    return ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      padding:const EdgeInsets.all(8.0),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        Message  messageData = messages[index];
                        return _buildMessage(messageData, widget.userId);
                      },
                    );
                  }


                  if(snapshot.hasError){
                    return Center(child: Text("${snapshot.error}"));
                  }

                  if(p.loading){
                    return const Center(child: CircularProgressIndicator());
                  }

                  return const Center(child:  Text("No Chats Available"),);

                });


              },

            ),
          ),
          if (_showEmojiPicker)
            EmojiPicker(
              config:const  Config(
                swapCategoryAndBottomBar: true,
                categoryViewConfig: CategoryViewConfig(
                  backgroundColor: Colors.white,
                ),
                bottomActionBarConfig: BottomActionBarConfig(
                  buttonColor: Colors.white,
                  enabled: true,
                  buttonIconColor: Colors.grey,
                  backgroundColor: Colors.white,
                ),
                searchViewConfig: SearchViewConfig(
                  backgroundColor: Colors.white,
                ),
                emojiViewConfig: EmojiViewConfig(
                  backgroundColor: Colors.white,
                ),
              ),
              onEmojiSelected: (category, emoji) {
                _messageController
                  ..text += emoji.emoji
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: _messageController.text.length),
                  );
              },
            ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFieldDecoration(
                            controller: _messageController,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_showEmojiPicker) {
                              _focusNode.requestFocus();
                              _showEmojiPicker = false;
                            } else {
                              _focusNode.unfocus();
                              _showEmojiPicker = true;
                            }
                          });
                        },
                      ),
                      Container(
                        margin:const  EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color:const  Color(0xFFFED957),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 40,
                        height: 40,
                        child: Center(
                          child: InkWell(
                            onTap: _sendMessage,
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}