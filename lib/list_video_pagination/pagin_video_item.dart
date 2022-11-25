import 'package:better_player/better_player.dart';
import 'package:better_player_example/list_video_pagination/pagin_model.dart';
import 'package:flutter/material.dart';

class PaginVideoItem extends StatefulWidget {
  final PaginModel item;

  const PaginVideoItem({Key? key, required this.item}) : super(key: key);

  @override
  State<PaginVideoItem> createState() => _PaginVideoItemState();
}

class _PaginVideoItemState extends State<PaginVideoItem> {
  PaginModel? get item => widget.item;
  BetterPlayerConfiguration? betterPlayerConfiguration;
  BetterPlayerListVideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = BetterPlayerListVideoPlayerController();
    betterPlayerConfiguration = BetterPlayerConfiguration(autoPlay: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
          ),
          AspectRatio(
              aspectRatio: 1,
              child: BetterPlayerListVideoPlayer(
                BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  item!.videoUrl,
                  bufferingConfiguration:
                      const BetterPlayerBufferingConfiguration(
                          minBufferMs: 2000,
                          maxBufferMs: 10000,
                          bufferForPlaybackMs: 1000,
                          bufferForPlaybackAfterRebufferMs: 2000),
                ),
                configuration: BetterPlayerConfiguration(
                    showPlaceholderUntilPlay: true,
                    autoPlay: false,
                    aspectRatio: 1,
                    handleLifecycle: true),
                //key: Key(videoListData.hashCode.toString()),
                // playFraction: 0.8,
                playFraction: 0.9,
                betterPlayerListVideoPlayerController: controller,
              )),
        ],
      ),
    );
  }
}
