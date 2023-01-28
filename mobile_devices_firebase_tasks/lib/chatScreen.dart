import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_devices_firebase_tasks/firebase_options.dart';
import 'package:mobile_devices_firebase_tasks/messages.dart';
import 'package:flutter/material.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final chatID = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room chat'),
        backgroundColor: const Color.fromARGB(255, 133, 165, 150),
      ),
      backgroundColor: const Color.fromARGB(255, 133, 165, 150),
      body: Column(
        children: [
          const Expanded(child: Messages()),
          BoxMessage(
            whenMessageSent: (String text) {
              db.collection("/Rooms/$chatID/room_chat").add(
                {
                  'text': text,
                  'author': 'competitor',
                  'date': Timestamp.now(),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final chatId = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder(
      stream: dbGetMessages(chatId),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Message>> snapshot,
      ) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data!;
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  color: Colors.white,
                  child: Text(message.text),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class BoxMessage extends StatefulWidget {
  final void Function(String) whenMessageSent;
  const BoxMessage({required this.whenMessageSent});

  @override
  BoxMessageState createState() => BoxMessageState();
}

class BoxMessageState extends State<BoxMessage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                widget.whenMessageSent(controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
