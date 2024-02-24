import 'package:ecommerce/core/class/Staterequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StateRequest stateRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.stateRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return stateRequest == StateRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loadingLottie))
        : stateRequest == StateRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offlineLottie))
            : stateRequest == StateRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.serverLottie))
                : stateRequest == StateRequest.failure
                    ? Lottie.asset(AppImageAsset.nodataLottie)
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StateRequest stateRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.stateRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return stateRequest == StateRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loadingLottie))
        : stateRequest == StateRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offlineLottie))
            : stateRequest == StateRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.serverLottie))
                : widget;
  }
}
