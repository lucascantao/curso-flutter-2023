import 'package:estoque/pages/about.dart';
import 'package:estoque/pages/footer.dart';
import 'package:estoque/pages/skill_knowledge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'pages/done_projects.dart';
import 'pages/resume.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey keySection1 = GlobalKey();
    GlobalKey keySection2 = GlobalKey();
    GlobalKey keySection3 = GlobalKey();
    GlobalKey keySection4 = GlobalKey();
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Portfolio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  await Scrollable.ensureVisible(keySection1.currentContext!,
                      duration: const Duration(milliseconds: 600));
                },
                child: const Text("Resume"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  await Scrollable.ensureVisible(keySection2.currentContext!,
                      duration: const Duration(milliseconds: 600));
                },
                child: const Text("Done Projects"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  await Scrollable.ensureVisible(keySection3.currentContext!,
                      duration: const Duration(milliseconds: 600));
                },
                child: const Text("Skill"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  await Scrollable.ensureVisible(keySection4.currentContext!,
                      duration: const Duration(milliseconds: 600));
                },
                child: const Text("About"),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Resume(key: keySection1),
            DoneProjects(key: keySection2),
            SkillKnowledge(key: keySection3),
            About(key: keySection4),
            const Footer()
          ]),
        ),
      ),
    );
  }
}
