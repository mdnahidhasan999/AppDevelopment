import 'package:flutter/material.dart';


//home: GalleryScreen(),

// initialRoute: '/',
//
// routes: {
//   '/': (context) => const HomeScreen(),
//   '/settings': (context) => const SettingScreen(),
//  // '/profile': (context) => const ProfileScreen()
// },
//
// onGenerateRoute: (settings){
//   if(settings.name == '/profile'){
//    String userName = settings.arguments as String;
//     return MaterialPageRoute(builder: (context){
//       return ProfileScreen(userName: userName);
//     });
//   }
//   return null;
// },





class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: const Text('Settings')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profile', arguments:'Rafat'
                  );
                },
                child: const Text('Profile')),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {

print(userName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: const Text('Home')),
            ElevatedButton(onPressed: () {}, child: const Text('Settings')),
          ],
        ),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Profile')),
            ElevatedButton(onPressed: () {}, child: const Text('Home')),
          ],
        ),
      ),
    );
  }
}
