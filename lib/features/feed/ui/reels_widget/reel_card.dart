import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starter/gen/assets.gen.dart';
import 'package:starter/utils/ui_const.dart';

class ReelsCard extends StatelessWidget {
  const ReelsCard({
    super.key,
  });

  static const _onTapAnimDuration = Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    late final AnimationController onTapController;
    return GestureDetector(
        onTap: () {
          onTapController.forward().whenComplete(() => onTapController.reset());
          HapticFeedback.mediumImpact();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: Ui.p8),
          width: 170,
          decoration: BoxDecoration(
            boxShadow: Ui.blackBoxShadow,
            image: DecorationImage(
                image: AssetImage(Assets.slider.soccer2.path),
                fit: BoxFit.cover),
            borderRadius:
                const BorderRadius.all(Radius.circular(Ui.borderRadius8)),
          ),
        )
            .animate(
                autoPlay: false,
                onInit: (controller) {
                  onTapController = controller;
                })
            .shimmer(duration: _onTapAnimDuration));
  }
}
