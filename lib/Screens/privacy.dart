import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Privacypolicy extends StatefulWidget {
  const Privacypolicy({super.key});

  @override
  State<Privacypolicy> createState() => _PrivacypolicyState();
}

class _PrivacypolicyState extends State<Privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Privacy policy'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: AutoSizeText(
              '''At Lyrica, your privacy is important to us. This Privacy Policy outlines how we collect, use, and share your information when you use our mobile application.
          
          We may collect basic information such as your name and email address when you register for our App. Additionally, we might gather data on how you interact with the App, including your music preferences and usage patterns.
          
          Your information is used primarily to enhance your experience by providing personalized music recommendations and to keep you informed with updates and notifications related to the App.
          
          We are committed to protecting your data and do not share your personal information with third parties, except when necessary to operate the App or comply with legal requirements. We have implemented appropriate security measures to safeguard your data from unauthorized access or disclosure.
          
          This Privacy Policy may be updated from time to time, and any changes will be reflected within the App.
          
          If you have any questions or concerns about this Privacy Policy, feel free to contact us at abhinavkk61@gmail.com.''',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
