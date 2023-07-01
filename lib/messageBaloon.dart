import 'package:flutter/material.dart';

class MessageBalloon extends StatelessWidget {
  final String isim;
  final String telNo;
  final String message;

  const MessageBalloon({
    Key? key,
    required this.isim,
    required this.telNo,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0), // Köşeleri yuvarlatma
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text("isim: $isim \nNumara: $telNo"),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(message),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
