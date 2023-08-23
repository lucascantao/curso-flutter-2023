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
    final router = GoRouter(initialLocation: '/resume', routes: [
      GoRoute(
          path: '/resume',
          pageBuilder: (context, state) => const MaterialPage(child: Resume())),
      GoRoute(
          path: '/doneProjects',
          pageBuilder: (context, state) =>
              const MaterialPage(child: DoneProjects())),
      GoRoute(
          path: '/skillInfo',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SkillInfo())),
      GoRoute(
          path: '/academicInfo',
          pageBuilder: (context, state) =>
              const MaterialPage(child: AcademicInfo())),
      GoRoute(
          path: '/about',
          pageBuilder: (context, state) => const MaterialPage(child: About())),
    ]);

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class NavLink extends StatelessWidget {
  final String link;
  final String title;
  final String selected;

  const NavLink(
      {super.key,
      required this.link,
      required this.title,
      required this.selected});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => GoRouter.of(context).go(link),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                (title == selected ? FontWeight.bold : FontWeight.normal),
          ),
        ));
  }
}

class Nav extends StatelessWidget {
  final String selected;
  const Nav({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Container(
          color: Colors.amber[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Portfolio"),
              Row(
                children: [
                  NavLink(link: '/resume', title: 'Resume', selected: selected),
                  NavLink(
                      link: '/doneProjects',
                      title: 'Done Projects',
                      selected: selected),
                  NavLink(
                      link: '/skillInfo',
                      title: 'Skill Info',
                      selected: selected),
                  NavLink(
                      link: '/academicInfo',
                      title: 'Academic Info',
                      selected: selected),
                  NavLink(link: '/about', title: 'About', selected: selected),
                ],
              )
            ],
          ),
        ));
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }
}

class Resume extends StatelessWidget {
  const Resume({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Nav(selected: 'Resume'), Text("Resume"), Footer()],
      ),
    );
  }
}

class DoneProjects extends StatelessWidget {
  const DoneProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Nav(
          selected: "Done Projects",
        ),
        Text("Done Projects")
      ],
    ));
  }
}

class SkillInfo extends StatelessWidget {
  const SkillInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Nav(
            selected: "Skill Info",
          ),
          Text("Skill Info")
        ],
      ),
    );
  }
}

class AcademicInfo extends StatelessWidget {
  const AcademicInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Nav(
            selected: "Academic Info",
          ),
          Text("Academic Info")
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Nav(
            selected: "About",
          ),
          Text("About")
        ],
      ),
    );
  }
}
