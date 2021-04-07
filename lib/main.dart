// ignore: avoid_web_libraries_in_flutter
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

enum Instrument { Piano, Violin, Guitar, Flute, None }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController;
  FilePickerResult result;
  PlatformFile file;

  Instrument instrument = Instrument.None;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage("assets/images/piano.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: height * 0.9,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "SPLIT UP",
                              style: GoogleFonts.vesperLibre(
                                  fontSize: 60, color: Colors.white),
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              "Isolating instruments oriented music score is now possible using AI, through SPLIT UP research project ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  fontSize: 25, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              "Gear up and change songs to a musical score. Drop your song and start playing.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  fontSize: 15, color: Colors.white38),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              scrollController.animateTo(height,
                                  duration: Duration(milliseconds: 700),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.00),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.00),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage("assets/images/guitar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: height * 0.9,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "SELECT AUDIO FILE",
                              style: GoogleFonts.vesperLibre(
                                  fontSize: 60, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    setState(() {
                                      file = result.files.first;
                                    });
                                  } else {}
                                },
                                child: Container(
                                  height: height * 0.4,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.00),
                                    border: Border.all(
                                        color: Colors.black, width: 3),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: width * 0.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            "DROP SONGS HERE",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Container(
                                          child: Text(
                                            "Accepting audio files, 0.5MB to 30MB",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.ubuntu(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: width * 0.6,
                                height: height * 0.4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.00),
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: width * 0.4,
                                            child: Text(
                                              file != null
                                                  ? "File Name: " + file.name
                                                  : "File Name: ",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            file != null
                                                ? "File Type: " + file.extension
                                                : "File Type: ",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            file != null
                                                ? "File Size: " +
                                                    formatBytes(file.size, 2)
                                                : "File Size: ",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (file != null) {
                                scrollController.animateTo(height + height,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Container(
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: file != null
                                      ? Border.all(
                                          color: Colors.black, width: 3)
                                      : null,
                                  borderRadius: BorderRadius.circular(15.00),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Center(
                                child: Text(
                                  "NEXT",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: file != null
                                          ? Colors.black
                                          : Colors.black54),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage("assets/images/background3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: height * 0.9,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "SELECT INSTRUMENT",
                              style: GoogleFonts.vesperLibre(
                                  fontSize: 55, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    instrument = Instrument.Piano;
                                  });
                                },
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.00),
                                      border: Border.all(
                                          color: instrument == Instrument.Piano
                                              ? Colors.amber
                                              : Colors.black,
                                          width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Container(
                                      //   width: width * 0.15,
                                      //   height: height * 0.15,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       image: AssetImage(
                                      //           "assets/Instruments/Piano.png"),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15),
                                      Text(
                                        "Instrument 1",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    instrument = Instrument.Violin;
                                  });
                                },
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.00),
                                      border: Border.all(
                                          color: instrument == Instrument.Violin
                                              ? Colors.amber
                                              : Colors.black,
                                          width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Container(
                                      //   width: width * 0.15,
                                      //   height: height * 0.15,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       image: AssetImage(
                                      //           "assets/Instruments/Violin.png"),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15),
                                      Text(
                                        "Instrument 2",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    instrument = Instrument.Flute;
                                  });
                                },
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.00),
                                      border: Border.all(
                                          color: instrument == Instrument.Flute
                                              ? Colors.amber
                                              : Colors.black,
                                          width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Container(
                                      //   width: width * 0.15,
                                      //   height: height * 0.15,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       image: AssetImage(
                                      //           "assets/Instruments/Flute.png"),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15),
                                      Text(
                                        "Instrument 3",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: file != null &&
                                        instrument != Instrument.None
                                    ? Border.all(color: Colors.black, width: 3)
                                    : null,
                                borderRadius: BorderRadius.circular(15.00),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Text(
                              "GENERATE MUSICAL SCORE",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: file != null
                                      ? Colors.black
                                      : Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(
                          "Upload Failure",
                          style: GoogleFonts.ubuntu(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        content: Text(
                          "Song can't be validated",
                          style: GoogleFonts.ubuntu(fontSize: 15),
                        ),
                        actions: <Widget>[
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "OK",
                              style: GoogleFonts.ubuntu(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.darken),
                        image: AssetImage("assets/images/background3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: height * 0.9,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(15.00),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: file != null &&
                                          instrument != Instrument.None
                                      ? Border.all(
                                          color: Colors.black, width: 3)
                                      : null,
                                  borderRadius: BorderRadius.circular(15.00),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Text(
                                "SHOW ALERT MESSAGE",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: file != null
                                        ? Colors.black
                                        : Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage("assets/images/musicalNotes.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: height * 0.9,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50.00, bottom: 20),
                            child: Text(
                              "Transcription - (Instrument Name)",
                              style: GoogleFonts.ubuntu(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.62,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Tempo: 61 BPM",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    "Time Signature: 4/4",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "   _     _     _     _   |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "   _     _     _     _   |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|   +    +    +    +     |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "    +    +    +    +    |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "   _     _     _     _   |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "|  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  Sa  Ri  Ga  Ma  |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "   _     _     _     _   |",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            color: Colors.red,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.orange,
                              elevation: 10,
                              child: Text(
                                "DOWNLOAD SHEET",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Positioned(
            //   top: height - height * 0.2,
            //   left: width - (width / 2 + 50),
            //   child:
            // ),
          ],
        ),
      ),
    );
  }
}
