

import 'package:flutter_clean/features/character/domain/entities/story.dart';

abstract class StoryRepository {
  List<Story> getStories();
  Story getStoryById({int id});
}
