import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starter/features/feed/ui/reels_widget/reel_card.dart';
import 'package:starter/utils/ui_const.dart';

class ListReelsContainer extends StatelessWidget {
  const ListReelsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomPaint(
        painter: const ShadowPainter(),
        child: ClipPath(
          clipper: const ClipperReels(),
          child: Container(
            padding:
                const EdgeInsets.only(left: Ui.p8, top: Ui.p20, bottom: Ui.p40),
            decoration: const BoxDecoration(
                color: UiColors.darkGrey, boxShadow: Ui.blackBoxShadow),
            height: 300,
            child: ListView.separated(
                shrinkWrap: true,
                cacheExtent: 100,
                addRepaintBoundaries: false,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: Ui.p8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final Duration delay =
                      Duration(milliseconds: 100 + ((index * 10) + 50));

                  return const ReelsCard()
                      .animate(delay: delay)
                      .fadeIn(duration: Ui.animateDuration1000, delay: delay)
                      .scale(
                          duration: Ui.animateDuration500,
                          begin: Offset.zero,
                          end: const Offset(1, 1));
                }),
          ),
        ),
      ),
    );
  }
}

class ShadowPainter extends CustomPainter {
  const ShadowPainter();

  @override
  void paint(Canvas canvas, Size size) {
    //draw shadow
    final paint = Paint()
      ..color = UiColors.darkGrey
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final path = Path()
      ..moveTo(0, -40)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.6, size.height - 20)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, -40)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ClipperReels extends CustomClipper<Path> {
  const ClipperReels();

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, -2);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.6, size.height - 20);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, -5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
