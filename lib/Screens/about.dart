import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              '''Welcome to Lyrica, your go-to destination for an unparalleled music experience. Our app is designed to bring you closer to the music you love, whether it's the latest hits, timeless classics, or hidden gems. We believe in the power of music to inspire, uplift, and connect people, and we've built this app with that in mind.
          
          Features:
          
          Personalized Music Experience: Discover new music tailored to your taste with our intelligent recommendation system.
          Curated Playlists: Explore a wide range of playlists curated by music experts and fellow users, covering every mood, genre, and occasion.
          Seamless Streaming: Enjoy high-quality music streaming with minimal buffering, ensuring that your music journey is smooth and uninterrupted.
          User-Friendly Interface: Navigate through the app with ease, thanks to our intuitive and clean design.
          Offline Listening: Download your favorite tracks and playlists to listen to them anytime, anywhere, even without an internet connection.
          Our Mission:
          At Lyrica, our mission is to create a platform where music lovers can find and enjoy their favorite tunes effortlessly. We strive to continuously improve our app by listening to your feedback and keeping up with the latest trends in the music world.
          
          Get Involved:
          Join our community of music enthusiasts! Share your favorite tracks, create and share playlists, and connect with other users who share your passion for music. Your input helps us shape the future of Lyrica.
          
          Thank You:
          We’re grateful to have you as part of the Lyrica family. Whether you're here to discover new music or to enjoy the songs you already love, we’re committed to making your experience enjoyable and memorable.
          
          ''',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
