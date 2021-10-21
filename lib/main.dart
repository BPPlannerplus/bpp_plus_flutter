import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
      observers: [
        Logger(),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginPage,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        theme: ThemeData(
          primaryColor: const Color(0xffffffff),
          canvasColor: const Color(0xffffffff),
          scaffoldBackgroundColor: const Color(0xffffffff),
          backgroundColor: const Color(0xffffffff),
        ),
      ),
    );
  }
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // ignore: avoid_print
    print('''
{
    "provider": "${provider.name ?? provider.runtimeType}",
}
''');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    // ignore: avoid_print
    print('''
{
    "providerDispose": "${provider.name ?? provider.runtimeType}",
}
''');
    super.didDisposeProvider(provider, containers);
  }
}

// class TestPage extends StatelessWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: Container(
//                   color: Colors.blue.withOpacity(.3),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 180,
//                     color: Colors.red,
//                     child: Center(child: Text('TOP AREA')),
//                   ),
//                   Container(
//                     height: 80,
//                     transform: Matrix4.translationValues(0, -30, 0),
//                     margin: EdgeInsets.symmetric(horizontal: 16),
//                     decoration: BoxDecoration(color: Colors.white, boxShadow: kElevationToShadow[3]),
//                     child: Row(
//                       children: [
//                         Spacer(),
//                         RaisedButton(onPressed: () {}),
//                         RaisedButton(onPressed: () {}),
//                         RaisedButton(onPressed: () {}),
//                         Spacer(),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     child: Column(
//                       children: [
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('hello'),),
//                         ListTile(title: Text('last element'),),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

