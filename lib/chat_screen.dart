import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chatmessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];


  void _sendMessage(){
    ChatMessage message = ChatMessage(text: _controller.text, sender: "User");
    
    setState(() {
      _messages.insert(0, message);
    });

    _controller.clear();
  }

  Widget _buildTextComposer(){
    return Row(
      children: [
        Expanded(child: TextField(
          controller: _controller,
          decoration: InputDecoration.collapsed(hintText: "Send a meesage"),

        )),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => _sendMessage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Demo")
      ),
      body: SafeArea(
        child: Column(
          children:[
            Flexible(child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context , index){
              return _messages[index];
      },)
            ),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
