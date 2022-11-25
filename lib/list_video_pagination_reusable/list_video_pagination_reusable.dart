//
// import 'package:better_player_example/list_video_pagination/pagin_image_item.dart';
// import 'package:better_player_example/list_video_pagination/pagin_model.dart';
// import 'package:better_player_example/list_video_pagination/pagin_repository.dart';
// import 'package:better_player_example/list_video_pagination_reusable/reusable/reusable_video_list_controller.dart';
// import 'package:better_player_example/list_video_pagination_reusable/reusable/reusable_video_list_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//
// class ListVideoPaginationReusablePage extends StatefulWidget {
//   const ListVideoPaginationReusablePage({Key? key}) : super(key: key);
//
//   @override
//   State<ListVideoPaginationReusablePage> createState() => _ListVideoPaginationReusablePageState();
// }
//
// class _ListVideoPaginationReusablePageState extends State<ListVideoPaginationReusablePage> {
//   static const _pageSize = 8;
//   final PagingController<int, PaginModel> _pagingController =
//   PagingController(firstPageKey: 0);
//
//   int lastMilli = DateTime.now().millisecondsSinceEpoch;
//   bool _canBuildVideo = true;
//
//   var value = 0;
//   final ScrollController _scrollController = ScrollController();
//   ReusableVideoListController videoListController = ReusableVideoListController();
//
//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     videoListController.dispose();
//     super.dispose();
//   }
//
//
//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
//
//       final newItems =
//       await PaginRepository().fetchPalyListName(pageKey, _pageSize);
//
//       final isLastPage = newItems.length < _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(newItems);
//       } else {
//         final nextPageKey = pageKey + newItems.length;
//         _pagingController.appendPage(newItems, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("pagination video list")),
//
//       body: Expanded(
//
//
//         child: NotificationListener<ScrollNotification>(
//           onNotification: (notification) {
//             final now = DateTime.now();
//             final timeDiff = now.millisecondsSinceEpoch - lastMilli;
//             if (notification is ScrollUpdateNotification) {
//               final pixelsPerMilli = notification.scrollDelta! / timeDiff;
//               if (pixelsPerMilli.abs() > 1) {
//                 _canBuildVideo = false;
//               } else {
//                 _canBuildVideo = true;
//               }
//               lastMilli = DateTime.now().millisecondsSinceEpoch;
//             }
//
//             if (notification is ScrollEndNotification) {
//               _canBuildVideo = true;
//               lastMilli = DateTime.now().millisecondsSinceEpoch;
//             }
//
//             return true;
//           },
//
//
//           child: Container(),
//
//           // child:PagedListView<int, PaginModel>(
//           //   pagingController: _pagingController,
//           //   builderDelegate: PagedChildBuilderDelegate<PaginModel>(
//           //       animateTransitions: true,
//           //
//           //       firstPageProgressIndicatorBuilder: (_) => firstPageIndicator(context),
//           //       newPageProgressIndicatorBuilder: (_) => NewItemIndicator(context),
//           //       // noMoreItemsIndicatorBuilder: (_) => NoMoreItemIndicator(context),
//           //       noItemsFoundIndicatorBuilder: (_) =>
//           //           noFirstItemsFoundIndicator(context),
//           //       newPageErrorIndicatorBuilder: (_) =>
//           //           newPageErrorIndicatorBuilder(context),
//           //       firstPageErrorIndicatorBuilder: (_) =>
//           //           firstPageErrorIndicatorBuilder(context),
//           //
//           //       // itemBuilder: (context, item, index) =>
//           //       //     CharacterListItem(character: item, index: index),
//           //       itemBuilder: (context, item, index) {
//           //         // return item.type=="Image"?PaginImageItem(item:item):PaginVideoItem(item:item);
//           //         return item.type=="Image"?PaginImageItem(item:item):Container(width: 300,height: 300, color: Colors.red, margin: EdgeInsets.all(5),);
//           //       }
//           //   ),
//           // ),
//
//
//
//
//           child: ListView.builder(
//             itemCount: dataList.length,
//             controller: _scrollController,
//             itemBuilder: (context, index) {
//               VideoListData videoListData = dataList[index];
//               return ReusableVideoListWidget(
//                 videoListData: videoListData,
//                 videoListController: videoListController,
//                 canBuildVideo: _checkCanBuildVideo,
//               );
//             },
//           ),
//
//
//
//
//         ),
//
//
//
//
//
//
//
//         // child: PagedListView<int, PaginModel>(
//         //   pagingController: _pagingController,
//         //   builderDelegate: PagedChildBuilderDelegate<PaginModel>(
//         //       animateTransitions: true,
//         //
//         //       firstPageProgressIndicatorBuilder: (_) => firstPageIndicator(context),
//         //       newPageProgressIndicatorBuilder: (_) => NewItemIndicator(context),
//         //       // noMoreItemsIndicatorBuilder: (_) => NoMoreItemIndicator(context),
//         //       noItemsFoundIndicatorBuilder: (_) =>
//         //           noFirstItemsFoundIndicator(context),
//         //       newPageErrorIndicatorBuilder: (_) =>
//         //           newPageErrorIndicatorBuilder(context),
//         //       firstPageErrorIndicatorBuilder: (_) =>
//         //           firstPageErrorIndicatorBuilder(context),
//         //
//         //       // itemBuilder: (context, item, index) =>
//         //       //     CharacterListItem(character: item, index: index),
//         //       itemBuilder: (context, item, index) {
//         //         return item.type=="Image"?PaginImageItem(item:item):PaginVideoItem(item:item);
//         //         // return item.type=="Image"?PaginImageItem(item:item):Container(width: 300,height: 300, color: Colors.red, margin: EdgeInsets.all(5),);
//         //       }
//         //   ),
//         // ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
//
//   Widget NewItemIndicator(BuildContext context) {
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(right: 10),
//       color: Colors.blueGrey,
//       child: const Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             " ...در حال دریافت",
//             style: TextStyle(color: Colors.white),
//             textAlign: TextAlign.right,
//           )),
//     );
//   }
//
//   Widget NoMoreItemIndicator(BuildContext context) {
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(right: 10),
//       color: Colors.yellow,
//       child: const Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             "!آیتم بیشتری برای نمایش وجود ندارد",
//             style: TextStyle(color: Colors.white),
//             textAlign: TextAlign.right,
//           )),
//     );
//   }
//
//   Widget newPageErrorIndicatorBuilder(BuildContext context) {
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(right: 10),
//       color: Colors.blueGrey,
//       child: const Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             "!خطا در دریافت اطلاعات",
//             style: TextStyle(color: Colors.white),
//             textAlign: TextAlign.right,
//           )),
//     );
//   }
//
//   Widget firstPageIndicator(BuildContext context) {
//     return const Center(
//         child: CircularProgressIndicator(
//           color: Colors.red,
//         ));
//   }
//
//   Widget noFirstItemsFoundIndicator(BuildContext context) {
//     return const Center(
//         child: Text(
//           "آیتمی برای نمایش وجود ندارد",
//           style: TextStyle(color: Colors.red),
//         ));
//   }
//
//   Widget firstPageErrorIndicatorBuilder(BuildContext context) {
//     return const Center(
//         child: Text(
//           "!خطا در دریافت اطلاعات",
//           style: TextStyle(color: Colors.red),
//         ));
//   }
//
//   bool _checkCanBuildVideo() {
//     return _canBuildVideo;
//   }
// }
