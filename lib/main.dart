import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:ui';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Ildiko',
      debugShowCheckedModeBanner: false,
      home: FirstRoute(),
    ),
  );
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> with TickerProviderStateMixin {
  bool _speechEnabled = false;
  final _speechToText = SpeechToText();

  var _isMicrophonePressed = false;
  var _showIldikoPress = true;

  @override
  void initState() {
    _initSpeech();
    super.initState();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
        finalTimeout: const Duration(seconds: 2));
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult, listenFor: const Duration(seconds: 5));
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      setState(() => {_isMicrophonePressed = false});
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecondRoute(onPressed: () {
                    setState(() => _showIldikoPress = true);
                  }))).then((value) => {
            setState(() => {_showIldikoPress = true}),
          });
    }
  }

  var defaultText = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E3192),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.2,
            top: -15,
            left: -35,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 300),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: -2.0,
              child: SvgPicture.asset('assets/images/blue_light.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.2,
            top: 220,
            left: -20,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 150),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: -2.0,
              child: SvgPicture.asset('assets/images/green.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.1,
            top: 400,
            left: 50,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 450),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: -2.0,
              child: SvgPicture.asset('assets/images/blue.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            top: -10,
            right: -10,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 900),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: 2.0,
              child: SvgPicture.asset('assets/images/purple.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.2,
            top: 150,
            right: 55,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 450),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: 2.0,
              child: SvgPicture.asset('assets/images/pink.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.height * 0.2,
            top: 280,
            right: 20,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 1200),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: 2.0,
              child: SvgPicture.asset('assets/images/blue_dark.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.25,
            bottom: 100,
            right: -40,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 1500),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.horizontal,
              offset: 2.0,
              child: SvgPicture.asset('assets/images/green.svg'),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.height * 0.25,
            top: 40,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 600),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.vertical,
              offset: -2.0,
              child: SvgPicture.asset('assets/images/ildiko_logo.svg'),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            bottom: 40,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 800),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.vertical,
              offset: 2.0,
              child: SvgPicture.asset('assets/images/ildiko_v2.svg'),
            ),
          ),
          Positioned(
            bottom: 20,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 2000),
              animationDuration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              direction: Direction.vertical,
              offset: 2.0,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'arobs.com',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://www.arobsgrup.ro/cariere/');
                          }),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: 20,
                  child: Visibility(
                    visible: _showIldikoPress,
                    child: ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 0),
                      animationDuration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      direction: Direction.horizontal,
                      offset: -2.0,
                      child: SizedBox(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Apasă, Ildiko te ascultă!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 12),
              ShowUpAnimation(
                delayStart: const Duration(milliseconds: 300),
                animationDuration: const Duration(seconds: 2),
                curve: Curves.bounceInOut,
                direction: Direction.vertical,
                offset: 1.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondRoute(
                          onPressed: () => {
                            setState(() => _showIldikoPress = true),
                          },
                        ),
                      ),
                    );
                  },
                  elevation: 10.0,
                  color: Colors.white,
                  child: ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 1200),
                    animationDuration: const Duration(seconds: 2),
                    curve: Curves.bounceInOut,
                    direction: Direction.horizontal,
                    offset: 2.0,
                    child: AvatarGlow(
                      showTwoGlows: true,
                      animate: _isMicrophonePressed,
                      glowColor: Colors.pink,
                      endRadius: 57.0,
                      child: Material(
                        elevation: 4.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.pink,
                          child: ShowUpAnimation(
                            delayStart: const Duration(milliseconds: 1800),
                            animationDuration: const Duration(seconds: 2),
                            curve: Curves.bounceInOut,
                            offset: -2.0,
                            direction: Direction.horizontal,
                            child: InkWell(
                                child: Image.asset(
                                    'assets/images/icon_microfon.png',
                                    width: 70.0,
                                    height: 70.0),
                                onTap: () {
                                  setState(() {
                                    _isMicrophonePressed = true;
                                    _showIldikoPress = false;
                                  });
                                  _startListening();
                                }),
                          ),
                          radius: 35.0,
                        ),
                      ),
                    ),
                  ),
                  shape: const CircleBorder(),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 65,
                child: Visibility(
                    visible: _isMicrophonePressed,
                    child: GlowingProgressIndicator(
                        child: const Text('Translating...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            )))),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  final VoidCallback onPressed;

  const SecondRoute({required this.onPressed});

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  AudioCache audioCache = AudioCache();
  final _sounds = [
    'sounds/arobs1.mp3',
    'sounds/arobs2.mp3',
    'sounds/arobs3.mp3',
    'sounds/arobs4.mp3',
    'sounds/arobs5.mp3',
    'sounds/arobs6.mp3',
    'sounds/arobs7.mp3',
    'sounds/arobs8.mp3',
    'sounds/arobs9.mp3',
    'sounds/arobs10.mp3',
    'sounds/arobs11.mp3',
    'sounds/arobs12.mp3',
    'sounds/arobs13.mp3',
    'sounds/arobs14.mp3',
    'sounds/arobs15.mp3',
    'sounds/arobs16.mp3',
    'sounds/arobs17.mp3',
    'sounds/arobs18.mp3',
    'sounds/arobs19.mp3',
    'sounds/arobs20.mp3',
    'sounds/arobs21.mp3',
    'sounds/arobs22.mp3',
    'sounds/arobs23.mp3',
    'sounds/arobs24.mp3',
    'sounds/arobs25.mp3',
    'sounds/arobs26.mp3',
    'sounds/arobs27.mp3',
    'sounds/arobs28.mp3',
    'sounds/arobs29.mp3',
    'sounds/arobs30.mp3',
    'sounds/arobs31.mp3',
    'sounds/arobs32.mp3',
    'sounds/arobs33.mp3',
    'sounds/arobs34.mp3',
    'sounds/arobs35.mp3',
    'sounds/arobs36.mp3',
    'sounds/arobs37.mp3',
    'sounds/arobs38.mp3',
    'sounds/arobs39.mp3',
    'sounds/arobs40.mp3',
    'sounds/arobs41.mp3',
    'sounds/arobs42.mp3',
    'sounds/arobs43.mp3',
    'sounds/arobs44.mp3',
    'sounds/arobs45.mp3',
    'sounds/arobs46.mp3',
    'sounds/arobs47.mp3',
    'sounds/arobs48.mp3',
    'sounds/arobs49.mp3',
    'sounds/arobs50.mp3',
    'sounds/arobs51.mp3',
    'sounds/arobs52.mp3',
    'sounds/arobs53.mp3',
    'sounds/arobs54.mp3',
    'sounds/arobs55.mp3',
    'sounds/arobs56.mp3',
    'sounds/arobs57.mp3',
    'sounds/arobs58.mp3',
    'sounds/arobs59.mp3',
    'sounds/arobs60.mp3',
    'sounds/arobs61.mp3',
    'sounds/arobs62.mp3',
    'sounds/arobs63.mp3',
    'sounds/arobs64.mp3',
    'sounds/arobs65.mp3',
    'sounds/arobs66.mp3',
    'sounds/arobs67.mp3',
    'sounds/arobs68.mp3',
    'sounds/arobs69.mp3',
  ];

  String _generateSound() {
    var rng = Random();
    return _sounds[rng.nextInt(_sounds.length)];
  }

  @override
  void initState() {
    audioCache.play(_generateSound()).then((value) => {
          Future.delayed(const Duration(seconds: 2), () {
            Alert(
                padding: EdgeInsets.zero,
                content: SizedBox(
                    child: Image.asset(
                  'assets/images/arobs_logo.png',
                  height: 80,
                  width: 80,
                )),
                context: context,
                type: AlertType.none,
                title: "Bine-o fost?",
                buttons: [
                  DialogButton(
                      color: Colors.green,
                      child: const Text("Da, fain!",
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                      onPressed: () => {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: const Color(0xff2E3192),
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                      child: SingleChildScrollView(
                                          child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              80,
                                          padding: const EdgeInsets.all(20),
                                          color: const Color(0xff2E3192),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        280, 10, 0, 40),
                                                height: 100,
                                                child: FloatingActionButton(
                                                    backgroundColor:
                                                        const Color(0xFF004aad),
                                                    child:
                                                        const Icon(Icons.close),
                                                    onPressed: () =>
                                                        Navigator.popUntil(
                                                            context, (route) {
                                                          return route.settings
                                                                  .name ==
                                                              "/";
                                                        })),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Center(
                                                          child: Text(
                                                        'Hai să ne cunoștem mai bine!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontSize: 17),
                                                      )))
                                                ],
                                              ),
                                              Transform.scale(
                                                  scale: 1.8,
                                                  child: SizedBox(
                                                      height: 130,
                                                      width: 210,
                                                      child: SvgPicture.asset(
                                                          'assets/images/ildiko_v2.svg'))),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        50, 50, 50, 20),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    launch('https://www.arobsgrup.ro/cariere/')
                                                        .then((value) =>
                                                            Navigator.popUntil(
                                                                context,
                                                                (route) {
                                                              return route
                                                                      .settings
                                                                      .name ==
                                                                  "/";
                                                            }));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.green,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0))),
                                                  child:
                                                      const Text('arobs.com'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ])));
                                })
                          }),
                  DialogButton(
                      color: Colors.blue[900],
                      child: const Text("Nu prea...",
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                      onPressed: () => {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: const Color(0xff2E3192),
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              80,
                                          padding: const EdgeInsets.all(20),
                                          color: const Color(0xff2E3192),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        280, 10, 0, 40),
                                                height: 100,
                                                child: FloatingActionButton(
                                                    backgroundColor:
                                                        const Color(0xFF004aad),
                                                    child:
                                                        const Icon(Icons.close),
                                                    onPressed: () =>
                                                        Navigator.popUntil(
                                                            context, (route) {
                                                          return route.settings
                                                                  .name ==
                                                              "/";
                                                        })),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Center(
                                                          child: Text(
                                                        'Poți mai bine? Hai să ne arăți!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontSize: 17),
                                                      )))
                                                ],
                                              ),
                                              Transform.scale(
                                                  scale: 1.8,
                                                  child: SizedBox(
                                                      height: 130,
                                                      width: 210,
                                                      child: SvgPicture.asset(
                                                          'assets/images/ildiko_v2.svg'))),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        50, 50, 50, 20),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    launch('https://www.arobsgrup.ro/cariere/')
                                                        .then((value) =>
                                                            Navigator.popUntil(
                                                                context,
                                                                (route) {
                                                              return route
                                                                      .settings
                                                                      .name ==
                                                                  "/";
                                                            }));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.green,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0))),
                                                  child:
                                                      const Text('arobs.com'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]));
                                })
                          }),
                ]).show();
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.onPressed();
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xff2E3192),
          // appBar: PreferredSize(
          //     child: AppBar(
          //       centerTitle: true,
          //       backgroundColor: const Color(0xff2E3192),
          //       title: const Text('Ildiko'),
          //     ),
          //     preferredSize: const Size.fromHeight(40.0)),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ildiko_page2_m.png'),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30.0, 230, 30, 90),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: const BorderSide(color: Color(0xFF48Bf2B))),
                        fixedSize: const Size(170.0, 40.0),
                        primary: const Color(0xFF48Bf2B),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Încearcă din nou!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
