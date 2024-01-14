import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jiffy/jiffy.dart';
import 'package:starter/gen/assets.gen.dart';
import 'package:starter/utils/ui_const.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: Ui.lightBoxShadow,
          color: UiColors.darkGrey,
          borderRadius: BorderRadius.all(Radius.circular(Ui.p8))),
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 360,
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
          top: Ui.p12, bottom: Ui.p8, left: Ui.p12, right: Ui.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Ui.borderRadius8),
                    topRight: Radius.circular(Ui.borderRadius8)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.slider.soccer1.path),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const Positioned(
                      left: Ui.p4,
                      right: Ui.p4,
                      bottom: Ui.p4,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        'Lorem ipsum dolor sit amet consectetur   adipiscing elit, sed do eiusmod tempor incididunt ut',
                        style: Ui.condensateLabelMediumWhite,
                      ),
                    ),
                  ],
                ),
              )),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Ui.p8, right: Ui.p8, bottom: 0, top: Ui.p4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: Ui.labelWhiteSmall,
                  ),
                  const Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      'Lorem ipsum dolor sit amet consectetur   adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut sasccdsdsc',
                      style: Ui.labelWhiteMedium),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Jiffy.parse(DateTime.now().toIso8601String()).from(
                              Jiffy.parse(DateTime.now()
                                  .subtract(const Duration(minutes: 5))
                                  .toIso8601String())),
                          style: Ui.labelWhiteSmall,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Ionicons.share_outline)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
