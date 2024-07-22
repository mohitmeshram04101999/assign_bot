//
//
// // class _BasicState extends State<Basic> {
// //   var key = 'sk-proj-L6DzLemHyPXQACcWj2tBT3BlbkFJna37Qy0F4mmGUaXSRg7o';
// //
// //
// //
// //   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
// //
// //   lodePusher()async
// //   {
// //
// //     userId = await MyHelper.getUserid();
// //     await pusher.init(
// //       //00ffde89fe6759b1cfc8
// //         apiKey: "00ffde89fe6759b1cfc8",
// //         cluster:"ap2",
// //         onEvent: myEvent,
// //         onSubscriptionSucceeded: onSubscriptionSucceeded
// //     );
// //
// //     await pusher.subscribe(channelName:"${userId}_${widget.id}");
// //     // await pusher.subscribe(channelName:"${widget.id}_${userId}");
// //     await pusher.connect();
// //
// //     setState(() {
// //
// //     });
// //
// //   }
// //
// //   //my Event //
// //   dynamic myEvent(PusherEvent event)
// //   {
// //     print("WhT IA EVENT nAMW = ");
// //     print(event);
// //
// //     if(event.eventName == "receive")
// //     {
// //       print(event.data);
// //       Map<String,dynamic> _data  = jsonDecode(event.data);
// //       MyHelper.chatProvider(context,listen: false).addNewMessage(Message(
// //         body: _data["message"],
// //         attachment: _data["file"],
// //         createdAt: DateTime.now(),
// //         fromId: widget.contact.id,
// //         toId: userId,
// //       ));
// //     }
// //   }
// //
// //   //subscribe//
// //   dynamic onSubscriptionSucceeded(s, d)
// //   {
// //     print("Subscribe Succ..");
// //     print("Event ${s}");
// //     print("Event ${d}");
// //   }
//
// import 'dart:convert';
// import 'package:assignbot/component/dimension.dart';
// import 'package:assignbot/controller/chat_controller.dart';
// import 'package:assignbot/controller/chat_controllers/fetch_message_api.dart';
// import 'package:assignbot/widgets/selectable_container.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
//
//
// FetchMessageApi _fetchMessageApi = Get.put(FetchMessageApi());
//
// class Basic extends StatefulWidget {
//   @override
//   _BasicState createState() => _BasicState();
// }
//
// class _BasicState extends State<Basic> {
//
//   var key = 'sk-proj-L6DzLemHyPXQACcWj2tBT3BlbkFJna37Qy0F4mmGUaXSRg7o';
//
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//
//   final ChatController chatController = Get.put(ChatController());
//
//   final ImagePicker _picker = ImagePicker();
//
//   bool _showEmojiPicker = false;
//
//   FocusNode _focusNode = FocusNode();
//
//   late TextEditingController _controller;
//
//   void myfunction (){
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       chatController.currentUser.value = ChatUser(
//         id: '1',
//         firstName: 'Charles',
//         lastName: 'Leclerc',
//         profileImage: 'assets/img.jpg',
//       );
//
//       chatController.otherUser.value = ChatUser(
//         id: '2',
//         firstName: 'Rohit',
//         lastName: 'Verstappen',
//         profileImage: 'assets/img.jpg',
//       );
//
//       // Initialize messages
//       chatController.messages.addAll([
//         ChatMessage(
//           text: _fetchMessageApi.messagemodel!.value.messages[0].body,
//           user: chatController.currentUser.value,
//           createdAt: DateTime.now(),
//         ),
//         ChatMessage(
//           text: 'Hello',
//           user: chatController.otherUser.value,
//           createdAt: DateTime.now().subtract(Duration(minutes: 1)),
//         ),
//       ]);
//
//       // Initialize the text editing controller
//       _controller = TextEditingController();
//
//       // Add a listener to the FocusNode to hide the emoji picker when the text field gains focus
//       _focusNode.addListener(() {
//         if (_focusNode.hasFocus) {
//           setState(() {
//             _showEmojiPicker = false;
//           });
//         }
//       });
//
//       lodePusher();
//     },);
//     // Initialize users
//
//   }
//
//   // INITSTATE METHOD //
//   @override
//   void initState() {
//     super.initState();
//     myfunction();
//   }
//
//   // DISPOSE METHOD //
//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   //  PUSHER FUNCTION //
//   void lodePusher() async {
//     chatController.userId.value = await MyHelper.getUserid();
//     await pusher.init(
//       apiKey: "00ffde89fe6759b1cfc8",
//       cluster: "ap2",
//       onEvent: myEvent,
//       onSubscriptionSucceeded: onSubscriptionSucceeded,
//     );
//
//     await pusher.subscribe(channelName: "${chatController.userId.value}");
//     await pusher.connect();
//
//     setState(() {});
//   }
//
//   // MY EVENT //
//   dynamic myEvent(PusherEvent event) {
//     print("What is event name = ");
//     print(event);
//
//     if (event.eventName == "receive") {
//       print(event.data);
//       Map<String, dynamic> _data = jsonDecode(event.data);
//       chatController.addNewMessage(ChatMessage(
//         text: _data["message"],
//         user: ChatUser(id: 'other_user_id'), // Adjust according to your logic
//         createdAt: DateTime.now(),
//       ));
//     }
//   }
//
//
//   // ON SUBSCRIPTION SUCCEEDS//
//   dynamic onSubscriptionSucceeded(s, d) {
//     print("Subscribe Success..");
//     print("Event ${s}");
//     print("Event ${d}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 18.0),
//             child: GestureDetector(
//               onTap: () {
//                 _showLogoutDialog();
//               },
//               child:  Container(
//                 width: SC.fromContextWidth(context, 11),
//                 child: Image.asset('assets/log.png'),
//               ),
//             ),
//           )
//         ],
//         foregroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: Padding(
//           padding: const EdgeInsets.only(left: 38.0),
//           child: Text(
//             'Chat',
//             style: TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ),
//         backgroundColor: Color(0xFFF60205),
//       ),
//       body: Column(
//         children: [
//
//           // BUTTON , NEW CHAT , RECENT CHAT //
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Obx(() => SelectableContainer(
//                 text: 'New Chat',
//                 isSelected: chatController.isNewChatSelected.value,
//                 onTap: chatController.toggleChatSelection,
//               )),
//               Obx(() => SelectableContainer(
//                 text: 'Recent Chat',
//                 isSelected: !chatController.isNewChatSelected.value,
//                 onTap: chatController.toggleChatSelection,
//               )),
//             ],
//           ),
//           Divider(
//             height: 8,
//             thickness: 1,
//             color: Colors.grey.shade200,
//           ),
//
//            // DASH CHAT WIDGET //
//           Expanded(
//             child: Obx(() => DashChat(
//               messageOptions: MessageOptions(
//                 showOtherUsersAvatar: false,
//                 showOtherUsersName: false,
//                 currentUserTextColor: Colors.black,
//                 currentUserContainerColor: Color(0xFFFED957),
//                 containerColor: Color(0xFFFCEFC0),
//                 showTime: true,
//                 timeFontSize: 13,
//                 timePadding: EdgeInsets.all(2),
//                 timeFormat: DateFormat('h:mm a'),
//               ),
//               inputOptions: InputOptions(
//                 cursorStyle: CursorStyle(color: Colors.grey),
//                 alwaysShowSend: true,
//                 inputToolbarMargin: EdgeInsets.all(10),
//                 autocorrect: true,
//                 inputDecoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     icon: Icon(_showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions_outlined,
//                         color: Colors.grey),
//                     onPressed: () {
//                       setState(() {
//                         if (_showEmojiPicker) {
//                           _focusNode.requestFocus();
//                         } else {
//                           _focusNode.unfocus();
//                           _showEmojiPicker = true;
//                         }
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                       color: Colors.grey.shade200,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                       color: Colors.grey.shade200,
//                     ),
//                   ),
//                   hintText: 'Write your query...',
//                 ),
//                 textCapitalization: TextCapitalization.sentences,
//                 textInputAction: TextInputAction.send,
//                 textController: _controller,
//                 focusNode: _focusNode,
//                 sendButtonBuilder: (void Function() onSend) {
//                   return GestureDetector(
//                     onTap: onSend,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 10),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFFED957),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 1,
//                             offset: Offset(0, 1),
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       width: 40,
//                       height: 40,
//                       child: Center(
//                         child: Icon(
//                           Icons.send,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               currentUser: chatController.currentUser.value,
//               onSend: (ChatMessage m) {
//                 // Ensure state changes occur after the build
//                 Future.delayed(Duration.zero, () {
//                   chatController.addNewMessage(m);
//                 });
//                 _controller.clear(); // Clear the input field after sending a message
//               },
//               messages: _fetchMessageApi.messages?.value??[],
//             )),
//           ),
//
//           // EMOJI PICKER //
//           if (_showEmojiPicker)
//             EmojiPicker(
//               config: Config(
//                 swapCategoryAndBottomBar: true,
//                 categoryViewConfig: CategoryViewConfig(
//                   backgroundColor: Colors.transparent,
//                 ),
//                 bottomActionBarConfig: BottomActionBarConfig(
//                   buttonColor: Colors.white,
//                   enabled: true,
//                   buttonIconColor: Colors.grey,
//                   backgroundColor: Colors.white,
//                 ),
//                 searchViewConfig: SearchViewConfig(
//                   backgroundColor: Colors.transparent,
//                 ),
//                 emojiViewConfig: EmojiViewConfig(
//                   backgroundColor: Colors.transparent,
//                 ),
//               ),
//               onEmojiSelected: (category, emoji) {
//                 _controller
//                   ..text += emoji.emoji
//                   ..selection = TextSelection.fromPosition(
//                     TextPosition(offset: _controller.text.length),
//                   );
//               },
//             ),
//         ],
//       ),
//     );
//   }
//   void _showLogoutDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//
//           content: Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: Text("Are you sure you want to logout?",style: TextStyle(fontSize: SC.fromWidth(24)),),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: SC.fromContextWidth(context, 4),
//                   height: SC.fromHeight(23),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [ Color(0xFFF60205), Color(0xFFFFDE59)],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Yes",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: SC.fromWidth(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Container(
//                   width: SC.fromContextWidth(context, 4),
//                   height: SC.fromHeight(23),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "No",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: SC.fromWidth(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         );
//       },
//     );
//   }
// }
//
// // MY HELPER CLASS /
// class MyHelper {
//   static Future<String> getUserid() async {
//     // Return a mock user ID for demonstration purposes.
//     return 'mock_user_id';
//   }
// }



import 'dart:io';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/chat_controllers/fetch_message_api.dart';
import 'package:assignbot/models/message_list_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:assignbot/widgets/custom_textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';




class ChattingPage extends StatefulWidget {

  final dynamic userId;
  const ChattingPage({super.key,required this.userId});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [

  ];
  final ScrollController _scrollController = ScrollController();
  bool _showEmojiPicker = false;

  void _sendMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      // setState(() {
        _messages.add({
          'text': message,
          'sender': 'user',
          'time': DateTime.now(),
          'seen': false,
        });
        _messageController.clear();
        _showEmojiPicker = false; // Hide emoji picker after sending message
        Future.delayed(Duration(milliseconds: 100), () {
          if (_scrollController.position.maxScrollExtent !=
              _scrollController.position.minScrollExtent) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      // });
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
    bool isUser = sender != currentUserId;

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
        title: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Color(0xFFF60205),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<RxList<Message>?>(
              future: fetchMessageApi.fetchmessageapi(widget.userId??2),
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text("${snapshot.error}"));
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                RxList<Message> messages = snapshot.data!;

                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: EdgeInsets.all(8.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message  messageData = messages[index];
                    return _buildMessage(messageData, widget.userId);
                  },
                );
              },

            ),
          ),
          if (_showEmojiPicker)
            EmojiPicker(
              config: Config(
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFieldDecoration(
                            controller: _messageController,
                            onSendMessage: _sendMessage,
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
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFED957),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
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