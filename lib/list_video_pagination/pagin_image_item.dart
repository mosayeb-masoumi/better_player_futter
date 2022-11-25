
import 'package:better_player_example/list_video_pagination/pagin_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PaginImageItem extends StatefulWidget {
  final PaginModel item;
  const PaginImageItem({Key? key, required this.item}) : super(key: key);

  @override
  State<PaginImageItem> createState() => _PaginImageItemState();
}

class _PaginImageItemState extends State<PaginImageItem> {

  PaginModel? get item => widget.item;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width:size.width,
      height: 300,
      // margin: const EdgeInsets.only(bottom: 5),
      child: CachedNetworkImage(
        imageUrl: item!.imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,),
          ),
        ),
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
      ),
    );
  }
}
