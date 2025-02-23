import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repositories_impl.dart';


class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoryImpl videoPostsRepository;

  bool initialLoading = true;

  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostsRepository.getTrendVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
