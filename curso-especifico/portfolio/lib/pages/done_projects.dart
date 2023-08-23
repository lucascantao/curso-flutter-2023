import 'package:flutter/material.dart';

class DoneProjects extends StatelessWidget {
  const DoneProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Done Projects")],
      ),
    );
  }
}
