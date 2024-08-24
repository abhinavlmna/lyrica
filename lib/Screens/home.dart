import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lottie/lottie.dart';
import 'package:lyrica/Screens/about.dart';
import 'package:lyrica/Screens/playlists.dart';
import 'package:lyrica/Screens/library.dart';
import 'package:lyrica/Screens/privacy.dart';
import 'package:lyrica/Screens/search.dart';
import 'package:lyrica/database/db_functions.dart';
// import 'package:on_audio_query/on_audio_query.dart';
import 'package:lyrica/database/db_model.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  const Homepage({super.key, required controller});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _bottomController =
      NotchBottomBarController(index: 0);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      HomeTab(),
      const Searchpage(),
      const Favourotepage(),
      const Librarypage(),
    ];

    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: Homepage.scaffoldKey,
      backgroundColor: Colors.blueGrey,
      body: PageView(
        controller: _pageController,
        children: bottomBarPages,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: mediaQuery.size.height * 0.3,
                child: Lottie.asset('assets/images/drawer.json'),
              ),
              Center(
                child: Container(
                  height: mediaQuery.size.height * 0.2,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        'LIVE IN ',
                        textStyle: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'Horizon',
                          color: Colors.grey,
                        ),
                      ),
                      RotateAnimatedText(
                        'LYRICA ',
                        textStyle: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'Horizon',
                          color: Colors.black,
                        ),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  size: 40,
                ),
                title: Text(
                  'Share',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Privacypolicy()),
                  );
                },
                leading: Icon(
                  Icons.security,
                  size: 40,
                ),
                title: Text(
                  'Privacy policy',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  _sendEmail();
                },
                leading: Icon(
                  Icons.question_answer,
                  size: 40,
                ),
                title: Text(
                  'Feedback',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Aboutpage()),
                  );
                },
                leading: Icon(
                  Icons.report,
                  size: 40,
                ),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.1,
              ),
              Center(
                child: Text(
                  'v.1.0.0',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchColor: Colors.grey,
        notchBottomBarController: _bottomController,
        shadowElevation: 5,
        elevation: 2,
        color: Colors.black,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.pink,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.search,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.search,
              color: Colors.pink,
            ),
            itemLabel: 'search',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.queue_music,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.queue_music,
              color: Colors.pink,
            ),
            itemLabel: 'playlists',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.subscriptions,
              weight: 600,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.subscriptions,
              color: Colors.pink,
            ),
            itemLabel: 'library',
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
          _pageController.jumpToPage(_index);
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
    );
  }

  Future<void> _sendEmail() async {
    final Email email = Email(
      body: 'Feedback',
      subject: 'Feedback for your app',
      recipients: ['abhinavkk61@gmail.com'],
      cc: [],
      bcc: [],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      print('Error sending email: $error');
    }
  }
}

// Create a separate widget for the Home tab
class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Future<List<MusicModel>> fetchSongsfromDb() async {
  //   List<SongModel> songlist = await _audioQuery.querySongs(
  //     sortType: null,
  //     orderType: OrderType.ASC_OR_SMALLER,
  //     uriType: UriType.EXTERNAL,
  //     ignoreCase: true,
  //   );
  //   addSongToDb(songs: songlist);

  //   return getAllSongs();
  // }

  // final _audioQuery = OnAudioQuery();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // return FutureBuilder<List<SongModel>>(
    //     future: _audioQuery.querySongs(
    //         sortType: null,
    //         orderType: OrderType.ASC_OR_SMALLER,
    //         uriType: UriType.EXTERNAL,
    //         ignoreCase: true),
    //     builder: (context, item) {
    //       if (item.data == null) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (item.data!.isEmpty) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Lottie.asset('assets/images/nodata.json'),
    //               Text(
    //                 'No Songs found',
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold),
    //               )
    //             ],
    //           ),
    //         );
    //       }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            height: mediaQuery.size.height * 0.4,
            width: mediaQuery.size.width * 0.97,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 30,
                  child: Lottie.asset(
                    'assets/images/music1.json',
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.8,
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Homepage.scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 40,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 8),
            child: Text(
              'All Songs',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('music'),
              );
              // return ListTile(
              //   leading: QueryArtworkWidget(
              //     nullArtworkWidget: Icon(Icons.headphones),
              //     id: item.data![index].id,
              //     type: ArtworkType.AUDIO,
              //   ),
              //   title: Text(
              //     item.data![index].displayNameWOExt,
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black),
              //   ),
              //   subtitle: Text(
              //     item.data![index].title,
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(fontSize: 17, color: Colors.black),
              //   ),
              //   trailing: IconButton(
              //     onPressed: () {
              //       int playsongid = item.data![index].id;
              //       showModalBottomSheet(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.only(
              //                   bottomLeft: Radius.circular(40),
              //                   bottomRight: Radius.circular(40))),
              //           context: context,
              //           builder: (context) {
              //             return Container(
              //               height: mediaQuery.size.height * 0.30,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.only(
              //                       topLeft: Radius.circular(40),
              //                       topRight: Radius.circular(40)),
              //                   color: Colors.black),
              //             );
              //           });
              //     },
              //     icon: Icon(Icons.more_vert),
              //   ),

              //   // need to complete bottomsheet
              // );
            },
          ),
        ),
      ],
    );
  }
}
