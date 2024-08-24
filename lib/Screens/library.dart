import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Librarypage extends StatefulWidget {
  const Librarypage({super.key});

  @override
  State<Librarypage> createState() => _LibrarypageState();
}

class _LibrarypageState extends State<Librarypage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQuery.size.height * 0.2,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: mediaQuery.size.width * 0.4 - 20,
                    child: Text(
                      'Library',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 238, 172, 195)),
                  height: mediaQuery.size.height * 0.2,
                  width: mediaQuery.size.width * 0.4,
                  child: Lottie.asset('assets/images/like.json'),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  height: mediaQuery.size.height * 0.2,
                  width: mediaQuery.size.width * 0.4,
                  child: Lottie.asset('assets/images/rc.json'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Liked Songs',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.35,
                ),
                Text(
                  'Recently Played',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
