import 'package:flutter/material.dart';



class SkillKnowledge extends StatelessWidget {
  const SkillKnowledge({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Skills")],
      ),
    );
  }
}
