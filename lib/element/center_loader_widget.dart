import 'package:flutter/material.dart';

class CenterLoaderWidget extends StatefulWidget {
  const CenterLoaderWidget({super.key, this.message = ""});

  final String message;

  @override
  CenterLoaderWidgetState createState() => CenterLoaderWidgetState();
}

class CenterLoaderWidgetState extends State<CenterLoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 35,
                  width: 35,
                  child: const CircularProgressIndicator(
                    color: Colors.blue,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                    widget.message.isNotEmpty ? widget.message : "Please Wait",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    )),
              )
            ],
          )),
    );
  }
}
