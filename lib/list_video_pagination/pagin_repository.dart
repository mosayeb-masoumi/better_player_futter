import 'package:better_player_example/list_video_pagination/pagin_model.dart';

class PaginRepository {
  Future<List<PaginModel>> fetchPalyListName(int pageKey, int pageSize) async {
    await Future.delayed(const Duration(seconds: 10));

    List<PaginModel> list = [];
    list.add(PaginModel(
        "Video",
        "img_url",
        "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4",
        "this is a video",
        "https://commons.wikimedia.org/wiki/File:Sunflower_from_Silesia2.jpg",));

    list.add(PaginModel(
      "Image",
      "https://upload.wikimedia.org/wikipedia/commons/b/b5/Lion_d%27Afrique.jpg",
      "video_url",
      "this is a image",
      "",));

    list.add(PaginModel(
      "Video",
      "img_url",
      "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_2MB.mp4",
      "this is a video",
      "https://commons.wikimedia.org/wiki/File:Sunflower_from_Silesia2.jpg",));

    list.add(PaginModel(
      "Image",
      "https://upload.wikimedia.org/wikipedia/commons/b/b5/Lion_d%27Afrique.jpg",
      "video_url",
      "this is a image",
      "",));


    list.add(PaginModel(
      "Video",
      "img_url",
      "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4",
      "this is a video",
      "https://commons.wikimedia.org/wiki/File:Sunflower_from_Silesia2.jpg",));

    list.add(PaginModel(
      "Image",
      "https://upload.wikimedia.org/wikipedia/commons/b/b5/Lion_d%27Afrique.jpg",
      "video_url",
      "this is a image",
      "",));

    list.add(PaginModel(
      "Video",
      "img_url",
      "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4",
      "this is a video",
      "https://commons.wikimedia.org/wiki/File:Sunflower_from_Silesia2.jpg",));

    list.add(PaginModel(
      "Image",
      "https://upload.wikimedia.org/wikipedia/commons/b/b5/Lion_d%27Afrique.jpg",
      "video_url",
      "this is a image",
      "",));





    return list;
  }
}
