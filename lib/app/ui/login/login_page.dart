import 'package:bpp_riverpod/app/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/login.mp4')
          ..initialize().then((_) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            _videoPlayerController.setVolume(0.0);
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _videoPlayerController.value.size.width,
                  height: _videoPlayerController.value.size.height,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
            Positioned(
              top: 133.h,
              left: 32.w,
              child: SvgPicture.asset(
                'assets/image/login_text.svg',
                width: 188,
                height: 66,
              ),
            ),
            Positioned(
              bottom: 56,
              left: 32.w,
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (_) => const MainPage(),
                      ),
                      (route) => false);
                },
                child: Image.asset(
                  'assets/image/kakao_login.png',
                  width: 296.w,
                  height: 44.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
