import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/gen/assets.gen.dart';
import 'package:starter/utils/routing/const_route.dart';
import 'package:starter/utils/ui_const.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: CustomPaint(
          painter: const ShadowPainter(),
          child: ClipPath(
            clipper: const ClipperReels(),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 20, bottom: 40),
              decoration:
                  const BoxDecoration(color: UiColors.darkGrey, boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(3, 10),
                )
              ]),
              height: 240,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) => const ReelsCard()
                      .animate(
                          delay: Duration(milliseconds: 100 + (index * 250)))
                      .fadeIn(
                        duration: const Duration(seconds: 1),
                        delay: Duration(milliseconds: 300 + (index * 250)),
                      )
                      .scale(
                        duration: const Duration(milliseconds: 500),
                        begin: Offset.zero,
                        end: const Offset(1, 1),
                      )),
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: IconButton(
          onPressed: () {
            context.pushNamed(RouteName.login);
          },
          icon: const Icon(Icons.add_circle_outline),
        ),
      )
    ]);
  }
}

class ShadowPainter extends CustomPainter {
  const ShadowPainter();

  @override
  void paint(Canvas canvas, Size size) {
    //draw shadow
    final paint = Paint()
      ..color = Colors.black
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.6, size.height - 20)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
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

    path.moveTo(0, 0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.6, size.height - 20);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ReelsCard extends HookWidget {
  const ReelsCard({
    super.key,
  });

  //double animation

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Ui.p8),
      width: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: UiColors.black.withOpacity(0.7),
            blurRadius: 4,
            offset: const Offset(3, 3),
          )
        ],
        image: DecorationImage(
            image: AssetImage(Assets.slider.soccer2.path), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
