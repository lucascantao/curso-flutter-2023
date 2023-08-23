import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

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
    GlobalKey keySection5 = GlobalKey();
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
                child: const Text("Academic"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  await Scrollable.ensureVisible(keySection5.currentContext!,
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
            SkillInfo(key: keySection3),
            AcademicInfo(key: keySection4),
            About(key: keySection5)
          ]),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}

class Resume extends StatelessWidget {
  const Resume({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Resume")],
      ),
    );
  }
}

class DoneProjects extends StatelessWidget {
  const DoneProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Done Projects")],
      ),
    );
  }
}

class SkillInfo extends StatelessWidget {
  const SkillInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Skills")],
      ),
    );
  }
}

class AcademicInfo extends StatelessWidget {
  const AcademicInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Academic")],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("About")],
      ),
    );
  }
}
