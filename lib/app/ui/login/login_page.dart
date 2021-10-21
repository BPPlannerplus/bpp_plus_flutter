import 'package:bpp_riverpod/app/ui/main_page.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              left: 21.w,
              child: RichText(
                text: TextSpan(
                  style: BppTextStyle.bigScreenText.copyWith(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: '바디플래너',
                      style: BppTextStyle.bigScreenText.copyWith(
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const TextSpan(
                      text: '에서\n바디프로필을 한눈에',
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 56,
              left: 16.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (_) => const MainPage(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(
                    0xfffee500,
                  ),
                ),
                child: SizedBox(
                  height: 44.h,
                  width: 296.w,
                  child: const Center(
                    child: Text(
                      '카카오 로그인',
                      style: BppTextStyle.screenText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
