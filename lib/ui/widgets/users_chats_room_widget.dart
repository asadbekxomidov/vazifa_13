// import 'package:flutter/material.dart';

// class ChatRoomScreen extends StatefulWidget {
//   final List<String> messages;

//   ChatRoomScreen({required this.messages});

//   @override
//   _ChatRoomScreenState createState() => _ChatRoomScreenState();
// }

// class _ChatRoomScreenState extends State<ChatRoomScreen> {
//   final TextEditingController _controller = TextEditingController();
//   List<Map<String, dynamic>> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//     _messages = widget.messages
//         .map((msg) => {'message': msg, 'isUser1': true})
//         .toList();
//   }

//   void _sendMessage(bool isUser1) {
//     setState(() {
//       _messages.add({'message': _controller.text, 'isUser1': isUser1});
//       _controller.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Room'),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(20),
//         itemCount: _messages.length,
//         itemBuilder: (context, index) {
//           var message = _messages[index];
//           bool isUser1 = message['isUser1'];
//           return Align(
//             alignment: isUser1 ? Alignment.centerRight : Alignment.centerLeft,
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 5),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: isUser1 ? Colors.blue : Colors.grey,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 message['message'],
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   hintText: 'Type a message',
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 // User1 sends message
//                 _sendMessage(true);
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 // User2 sends message
//                 _sendMessage(false);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  final List<String> messages;

  ChatRoomScreen({required this.messages});

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // Alternate messages between users for demonstration
    bool isUser1 = true;
    _messages = widget.messages.map((msg) {
      var message = {'message': msg, 'isUser1': isUser1};
      isUser1 = !isUser1;
      return message;
    }).toList();
  }

  void _sendMessage(bool isUser1) {
    setState(() {
      _messages.add({'message': _controller.text, 'isUser1': isUser1});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          var message = _messages[index];
          bool isUser1 = message['isUser1'];
          return Align(
            alignment: isUser1 ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isUser1 ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message['message'],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage(true);
              },
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // User2 sends message
                _sendMessage(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}