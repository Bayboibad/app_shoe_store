import 'package:app_shoe_store/bloc/loading_bloc.dart';
import 'package:app_shoe_store/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        if (state == LoadingState.showing) {
          return const SpinKitPouringHourGlass(
            color: AppColors.BackgroudApp,
            size: 80.0,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
