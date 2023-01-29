import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id;
  String author;
  DateTime date;
  String text;

  Message.fromFirestore(DocumentSnapshot<Map<String, dynamic>> docSnap)
      : id = docSnap.id,
        author = docSnap['author'],
        date = (docSnap['date'] as Timestamp).toDate(),
        text = docSnap['text'];
}

Stream<List<Message>> dbGetMessages(int currentRoom) async* {
  final db = FirebaseFirestore.instance;
  final messagePath = "/Rooms/room_$currentRoom/chat";
  final query =
      db.collection(messagePath).orderBy("date", descending: true).limit(100);

  await for (final qsnap in query.snapshots()) {
    List<Message> messages = [];
    for (final doc in qsnap.docs) {
      messages.add(Message.fromFirestore(doc));
    }
    yield messages;
  }
}
