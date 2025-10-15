import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';
import 'topic_card.dart';

class TopicData {
  final IconData icon;
  final String text;
  final Color color;
  final String message;

  TopicData({
    required this.icon,
    required this.text,
    required this.color,
    required this.message,
  });
}

class PopularTopicsSection extends StatelessWidget {
  final List<TopicData> topics;
  final Function(String) onTopicTap;

  const PopularTopicsSection({
    Key? key,
    required this.topics,
    required this.onTopicTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Topics', style: AppStyles.headingMedium),
          const SizedBox(height: 16),
          SizedBox(
            height: AppDimensions.topicCardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final topic = topics[index];
                return TopicCard(
                  icon: topic.icon,
                  text: topic.text,
                  color: topic.color,
                  onTap: () => onTopicTap(topic.message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
