import 'package:better_player_example/single_video_example/better_player_page.dart';
import 'package:better_player_example/slider/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'list_video_example/list_video_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  // createFolders(type: "single");
                  if (await Permission.storage.request().isGranted) {
                    createFolders(type: "single");
                  }
                },
                child: Text("single video player")),
            ElevatedButton(
                onPressed: () async {
                  if (await Permission.storage.request().isGranted) {
                    createFolders(type: "list");
                  }
                },
                child: Text("list image video player")),
            ElevatedButton(
                onPressed: () async {
                  if (await Permission.storage.request().isGranted) {
                    createFolders(type: "slider");
                  }
                },
                child: Text("slider image video player")),
          ],
        ),
      ),
    );
  }

  Future<void> createFolders({required String type}) async {
    // await CreateFolder().betterExampleFolderExistence();
    // await CreateFolder().imageFolderExistence();
    // await CreateFolder().videoFolderExistence();

    type == "single"
        ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoPlayerPage()),
          )
        : type == "slider"
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SliderPage()),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListPlayerPage()),
              );
  }
}
