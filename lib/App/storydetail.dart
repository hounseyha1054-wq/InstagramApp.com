import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  final Map user; // Data passed from main screen

  const StoryDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            Center(child: Image.network(user['postImage'], fit: BoxFit.cover)),

            SafeArea(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['userImage']),
                ),
                title: Text(
                  user['username'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
