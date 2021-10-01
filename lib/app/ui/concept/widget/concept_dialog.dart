import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConceptDialog extends StatelessWidget {
  const ConceptDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(1),
      child: SizedBox(
        height: 296.h,
        width: 280.w,
      ),
    );
  }
}
