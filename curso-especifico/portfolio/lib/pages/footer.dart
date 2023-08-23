import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black38,
        height: MediaQuery.of(context).size.height * 0.25,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "contacts",
              style: TextStyle(color: Colors.white38),
            ),
          ],
        ),
      ),
    );
  }
}
