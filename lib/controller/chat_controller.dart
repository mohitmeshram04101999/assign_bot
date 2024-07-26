import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  var messages = <ChatMessage>[].obs;
  var isNewChatSelected = true.obs;
  var userId = ''.obs;
  var currentUser = ChatUser(id: '').obs;
  var otherUser = ChatUser(id: '').obs;

  void addMessage(ChatMessage message) {
    messages.insert(0, message);
  }

  void toggleChatSelection() {
    isNewChatSelected.value = !isNewChatSelected.value;
  }

  void setUserId(String id) {
    userId.value = id;
  }
}
