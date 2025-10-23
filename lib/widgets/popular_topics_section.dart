import 'package:flutter/material.dart';
import 'topic_card.dart';

class PopularTopicsSection extends StatelessWidget {
  final Function(String) onTopicTap;

  const PopularTopicsSection({Key? key, required this.onTopicTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final horizontalPadding = width * 0.04;
        final gap = width * 0.03;

        final topics = [
          ('Talk to your data\ntopics here', Icons.auto_awesome, Colors.blue),
          ('Talk to your data\ntopics here', Icons.flag_outlined, Colors.red),
        ];

        final availableWidth = width - (horizontalPadding * 2);
        final cardWidth = (availableWidth - gap) / 2;

        final cardHeight = screenHeight * 0.16;

        final childAspectRatio = cardWidth / cardHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Popular Topics',
                style: TextStyle(
                  fontSize: (width * 0.05).clamp(14.0, 22.0),
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: screenHeight * 0.015)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: gap,
                mainAxisSpacing: gap,
                childAspectRatio: childAspectRatio,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(topics.length, (index) {
                  final topic = topics[index];
                  return TopicCard(
                    text: topic.$1,
                    icon: topic.$2,
                    iconColor: topic.$3,
                    onTap: () => onTopicTap(topic.$1),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
