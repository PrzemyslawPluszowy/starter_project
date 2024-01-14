import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/features/starer_page/ui/cubit/start_slider_cubit.dart';
import 'package:starter/gen/assets.gen.dart';
import 'package:starter/utils/routing/const_route.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/ui_const.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final ValueNotifier<List<AnimationController>> _controllers =
      ValueNotifier([]);
  final ValueNotifier<bool> _showMenu = ValueNotifier(false);

  static const double _hidePos = -250;
  static const _animatePositioned = Duration(milliseconds: 1000);
  static const _animateOpacity = Duration(milliseconds: 3000);
  static const _animateFadeOut = Duration(milliseconds: 1000);
  static const _animateShimmer = Duration(milliseconds: 5000);
  static const _tilesCount = 55;
  static const List<Color> _colorsShimmer = [
    Colors.yellow,
    Colors.green,
    Colors.yellow,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<StarterPageCubit, StarterPageSate>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.slider.soccer1.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              _buildAnimatedMenu(),
              Positioned.fill(
                child: _buildShaderMaskGridView(context),
              ),
              _buildMenuButton(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnimatedMenu() {
    return ValueListenableBuilder(
      valueListenable: _showMenu,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: _animatePositioned,
          left: value ? Ui.p20 : _hidePos,
          top: value ? Ui.p20 : _hidePos,
          child: AnimatedOpacity(
            duration: _animateOpacity,
            opacity: value ? 1 : 0,
            child: Container(
              width: 80,
              height: 150,
              padding: const EdgeInsets.all(Ui.p8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.herb.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShaderMaskGridView(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return _buildGridItem(context, index);
      },
      itemCount: _tilesCount,
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return Container(
      width: (MediaQuery.of(context).size.width - (1 * index)) / 5,
      height: (MediaQuery.of(context).size.height - (1 * index)) / 10,
      color: Colors.black.withOpacity(0.9),
    ).animate(
      onInit: (controller) {
        _controllers.value.add(controller);
        controller.forward();
      },
      onComplete: (controller) {
        _controllers.value.remove(controller);
        if (_controllers.value.length == 5) {
          _showMenu.value = true;
        }
      },
    ).fadeOut(
      delay: Duration(milliseconds: 500 * Random().nextInt(7)),
      duration: _animateFadeOut,
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _showMenu,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: _animatePositioned,
          bottom: value ? 0 : _hidePos,
          child: GestureDetector(
            onTap: () {
              _showMenu.value = false;
              Future.delayed(_animatePositioned, () {
                context.goNamed(RouteName.feed);
              });
            },
            child: ClipPath(
              clipBehavior: Clip.antiAlias,
              clipper: _CustomClipper(),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: UiColors.black.withOpacity(0.8),
                ),
                padding: const EdgeInsets.all(Ui.p20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(Ui.p8),
                    margin: const EdgeInsets.only(top: Ui.p8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: UiColors.green,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Witaj w LKS Pisarowice',
                      style: TextStyle(
                        fontSize: Ui.fontSize24,
                        fontWeight: FontWeight.normal,
                        color: UiColors.green,
                      ),
                    )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .shimmer(
                          angle: pi / 8,
                          duration: _animateShimmer,
                          colors: _colorsShimmer,
                        ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..moveTo(0, 40)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(_CustomClipper oldClipper) => true;
}
