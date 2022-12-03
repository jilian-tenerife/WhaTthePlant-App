import 'package:app/screens/camera_screen.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/temporary_screens.dart';
import 'package:app/style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/screens/inbox.dart';

late List<CameraDescription> _cameras;
List<CameraDescription> getCameras() {
  return _cameras;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      home: const LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const _colors = [
    Style.greenNavbar,
    Style.blueNavbar,
    Style.yellowNavbar
  ];
  int _currentScreen = 2;
  PageController _pageController = PageController(initialPage: 1);

  late CameraController? _cameraController;
  Future<void> initCamera({required bool frontCamera}) async {
    _cameraController =
        CameraController(_cameras[(frontCamera) ? 1 : 0], ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (_cameras.isNotEmpty) {
      initCamera(frontCamera: true);
    }
  }

  @override
  void dispose() {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.black,
      body: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentScreen = index;
              });
            },
            children: <Widget>[
              Inbox(),
              CameraScreen(
                  cameraController: _cameraController, initCamera: initCamera),
              TemporaryScreen(color: _colors[2]),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(90.0),
            child: Align(
              alignment: Alignment(0.0, 1.2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: BottomNavigationBar(
                    selectedItemColor: Style.yellow,
                    unselectedItemColor: Style.white,
                    backgroundColor: Color(0xffEAB64D).withOpacity(0.5),
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: _currentScreen,
                    onTap: (int index) {
                      setState(() {
                        _pageController.jumpToPage(index);
                      });
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.chat_bubble),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.device_phone_portrait),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.settings_solid), label: ''),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
