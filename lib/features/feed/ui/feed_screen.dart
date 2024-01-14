import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starter/features/feed/ui/feed/feed_card.dart';
import 'package:starter/features/feed/ui/reels_widget/list_reels_container.dart';
import 'package:starter/utils/ui_const.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Ui.p8),
            width: double.infinity,
            color: UiColors.darkGrey,
            child: const Text(
              'Najnowsze relacje',
              style: Ui.condensateLabelMediumWhite,
            ),
          ),
        ),
        const ListReelsContainer(),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: Ui.p8, vertical: Ui.p12),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Co u nas słychać?',
              style: Ui.condensateLabelMedium,
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return const FeedCard()
                .animate(
                  autoPlay: true,
                )
                .fadeIn(
                  duration: Ui.animateDuration1000,
                  delay: Ui.animateDuration300,
                )
                .scale(
                    duration: Ui.animateDuration500,
                    begin: Offset.zero,
                    end: const Offset(1, 1));
          },
        )
      ],
    );
  }
}
