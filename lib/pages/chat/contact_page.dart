import 'dart:developer';

import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/chat_controllers/contact_api.dart';
import 'package:assignbot/controller/chat_controllers/fetch_message_api.dart';
import 'package:assignbot/pages/chat/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

// ContactApi _contactApi = Get.put(ContactApi());

FetchMessageApi _fetchMessageApi = Get.put(FetchMessageApi());

String formatHourWithLabel(DateTime dateTime) {
  return '${DateFormat('H').format(dateTime)} hr';  // Format as "12 hr"
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Future<void> fetchContactsFuture;

  @override
  void initState() {
    super.initState();
    final contactApi = Get.put(ContactApi()); // Use Get.find() to retrieve the instance
    fetchContactsFuture = contactApi.fetchContactApi();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> people = [
      {
        'image': 'assets/person.png',
        'name': 'Ronnie Coleman',
        'subtitle': 'Wanted to know more...',
        'time': '1hr ago'
      },
      {
        'image': 'assets/person2.png',
        'name': 'Arnold Schwarzenegger',
        'subtitle': 'Coming to the gym...',
        'time': '2hrs ago'
      },
      {
        'image': 'assets/person.png',
        'name': 'Dorian Yates',
        'subtitle': 'Let\'s meet up...',
        'time': '3hrs ago'
      },
      {
        'image': 'assets/person2.png',
        'name': 'Jay Cutler',
        'subtitle': 'Training session...',
        'time': '4hrs ago'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text('Chats', style: TextStyle(fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Color(0xFFF60205),
      ),
      body: FutureBuilder<void>(
        future: fetchContactsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the future is still loading
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            // If the future completed with an error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If the future completed successfully
            final contactApi = Get.find<ContactApi>();
            final contacts = contactApi.userContactModel?.value.contacts ?? [];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          _fetchMessageApi.fetchmessageapi(contact.id);
                          Get.to(ChattingPage(userId: contact.id));
                        },
                        // leading: Image.asset(people[index]['image']!),
                        title: Text(
                          contact.name ?? '',
                          style: TextStyle(fontSize: SC.fromWidth(24)),
                        ),
                        subtitle: Text(
                          contact.email ?? '',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text(
                            timeago.format(contact.maxCreatedAt ?? DateTime.now()),
                            style: TextStyle(fontSize: SC.fromWidth(35)),
                          ),
                        ),
                      ),
                      Divider(), // To separate each ListTile
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
