import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Favourotepage extends StatefulWidget {
  const Favourotepage({super.key});

  @override
  State<Favourotepage> createState() => _FavourotepageState();
}

class _FavourotepageState extends State<Favourotepage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQuery.size.height * 0.4,
            width: mediaQuery.size.width * 1,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: 160,
                    child: Text(
                      'Playlists',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 80,
                    left: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Lottie.asset(
                        'assets/images/fill.json',
                        height: mediaQuery.size.height * 0.3,
                        width: mediaQuery.size.width * 0.7,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
