import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: 60,
                    left: 20,
                    right: 20,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Search songs here......',
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    )),
                Positioned(
                    top: 30,
                    left: 50,
                    child: Lottie.asset('assets/images/search.json',
                        height: mediaQuery.size.height * 0.5,
                        width: mediaQuery.size.width * 0.8))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('music'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
