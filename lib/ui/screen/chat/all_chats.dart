import 'package:apna_farm/ui/screen/chat/chat.dart';
import 'package:apna_farm/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ApnaChatsScreen extends StatelessWidget {
  const ApnaChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApnaAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 44),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/6997/6997662.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/4042/4042356.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/6084/6084667.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/4042/4042337.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/4128/4128176.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/145/145937.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/145/145938.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/4323/4323015.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/6084/6084542.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/145/145930.png',
                  ),
                  MessageTile(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/146/146029.png',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 25,
            right: 0,
            child: const Text(
              'Messages',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String imageUrl;

  const MessageTile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, ApnaChatScreen.route()),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: NetworkImage(imageUrl),
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: const Text(
        'User Name',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: const Text('Hello, I want to know the amount of ....'),
    );
  }
}
