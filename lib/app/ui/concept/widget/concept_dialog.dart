import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConceptDialog extends StatelessWidget {
  const ConceptDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        height: 296.h,
        width: 296.w,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned.fill(
              child: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.fill,
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                height: 30.h,
                color: Colors.grey.shade300,
              ),
            ),
            Row(
              children: const [
                Text('Studio name'),
                Icon(Icons.arrow_back_ios_new),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
