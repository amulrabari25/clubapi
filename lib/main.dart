import 'package:clubapicall/controller/club_controller.dart';
import 'package:clubapicall/element/text_heading_black_widget.dart';
import 'package:clubapicall/element/text_light_widget.dart';
import 'package:clubapicall/models/club.dart';
import 'package:clubapicall/util/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'element/center_loader_widget.dart';
import 'element/text_heading_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  StateMVC<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  // Sample list of items
  bool _showLoading = true;
  final ClubController _clubController = ClubController();

  @override
  void initState() {
    super.initState();
    getClubListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const TextHeadingWidget(text: "Club Listing"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                if (_clubController.topClubDetails.isNotEmpty) ...[
                  Expanded(
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: _clubController.topClubDetails.length,
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        // padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextHeadingBlackWidget(
                                              text: _clubController
                                                  .topClubDetails[index]
                                                  .clubFullName
                                                  .toString(),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextLightWidget(
                                              text: _clubController
                                                  .topClubDetails[index].city
                                                  .toString(),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextLightWidget(
                                              text: _clubController
                                                  .topClubDetails[index]
                                                  .postalCode
                                                  .toString(),
                                            ),
                                          ),
                                          const SizedBox(height: 10)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          iconSize: 24,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black87,
                                            size: 24.0,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 24,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Warning'),
                                                  content: const Text(
                                                      'Are you sure you want to delete this club?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(false); // No
                                                      },
                                                      child: const Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(true); // Yes
                                                      },
                                                      child: const Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ).then((value) {
                                              if (value != null && value) {
                                                deleteClubApi(
                                                    _clubController
                                                        .topClubDetails[index],
                                                    index);
                                              } else {
                                                // User clicked No or dialog was dismissed
                                                // Add your logic here
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.black87,
                                            size: 24.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                          );
                        }),
                  )
                ]
              ],
            ),
            if (_showLoading) ...[const CenterLoaderWidget()],
          ],
        ),
      ),
    );
  }

  void getClubListApi() {
    Helper().checkInternet().then((internet) {
      if (internet) {
        _clubController.getClubListApi().then((value) async {
          if (mounted) {
            setState(() {
              _showLoading = false;
            });
          }
        }).onError((error, stackTrace) {
          if (mounted) {
            setState(() {
              _showLoading = false;
            });
            Helper.showSnackBar(true, error as String, context);
          }
        });
      } else {
        print("No Internet Connection !");
        // Future.delayed(Duration(milliseconds: 1000), () {

        setState(() {
          Helper.showSnackBar(true, "No internet connection!", context);
          _showLoading = false;
        });
      }
    });
  }

  void deleteClubApi(
    Club club,
    int index,
  ) {
    setState(() {
      _showLoading = true;
    });
    Helper().checkInternet().then((internet) {
      if (internet) {
        _clubController.deleteClubApi(club.clubID!).then((value) {
          if (mounted) {
            setState(() {
              Helper.showSnackBar(false, "Delete Club Successfully", context);
              _showLoading = false;
              _clubController.topClubDetails.removeAt(index);
            });
          }
        }).onError((error, stackTrace) {
          setState(() {
            Helper.showSnackBar(true, error as String, context);
            _showLoading = false;
          });
        });
      } else {
        setState(() {
          Helper.showSnackBar(true, "No internet connection!", context);
          _showLoading = false;
        });
      }
    });
  }
}
