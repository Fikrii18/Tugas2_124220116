import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_pages.dart';
class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); 
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Profile"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Username: ${widget.username}'),
              ),
            ),
            Center(
              child: Column(children: [
                ElevatedButton(
                  onPressed: () {
                    String url = 'https://www.instagram.com/_fik1809?igsh=MTNpZTdwajNicjNnaQ==';
                    _launchURL(url);
                  },
                  child: const Text('About App'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginPages();
                      },
                    ));
                  },
                  child: const Text('Logout'),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
