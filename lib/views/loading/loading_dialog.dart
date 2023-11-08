
import 'package:app_shoe_store/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitPouringHourGlass(
      color: AppColors.BackgroudApp,
      size: 50.0,
    );
  }
}
