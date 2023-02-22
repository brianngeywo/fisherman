// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final messages = [
//     {"sender": "Person 1", "text": "Hey, how are you?"},
//     {
//       "sender": "Person 2",
//       "text": "I'm good, thanks for asking. How about you?"
//     },
//     {"sender": "Person 1", "text": "I'm doing well too, thanks."},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Chat Page"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ChatMessage(
//                   sender: messages[index]["sender"]!,
//                   text: messages[index]["text"]!,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   String sender;
//   String text;
//
//   ChatMessage({super.key, required this.sender, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             sender,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 5.0),
//             child: Text(text),
//           ),
//         ],
//       ),
//     );
//   }
// }
