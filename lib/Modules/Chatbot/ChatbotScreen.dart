import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  Future<void> sendMessageToAPI(String message) async {
    // Prepare the data to send
    Map<String, String> data = {
      'message': message,
    };

    // Make an HTTP POST request to your Flask API endpoint
    final response = await http.post(
      Uri.parse('http://192.168.145.213:5000/process_message'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String botResponse = responseData['response'];

      // Update the chat interface with the bot's response
      setState(() {
        chatMessages.add(ChatMessage(botResponse, false));
      });
    } else {
      // Error handling
      print('Failed to send message. Error ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                reverse: true, // Reverse the list to show new messages at the bottom
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(chatMessages[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _messageController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Type your message...',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.send),
                                // Inside the onPressed function of the IconButton
                                      onPressed: () {
                                        String message = _messageController.text;
                                         setState(() {
                                          chatMessages.add(ChatMessage(message, true)); // true indicates it's a user message
                                        });
                                        // Clear the text field
                                        _messageController.clear();  
                                      // Send the message to the API
                                        sendMessageToAPI(message);
                                      },

                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage(this.text, this.isUser);
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  ChatBubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: message.isUser ? Colors.green : Colors.white,
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
