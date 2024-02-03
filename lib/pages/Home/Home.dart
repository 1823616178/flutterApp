import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/api/home.dart';

final _api = Api();

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _home createState() => _home();
}

class _home extends State<Home> with SingleTickerProviderStateMixin {
  late List bookList = [];
  final defaultImage = AssetImage('lib/assets/img/image-none.png');
  late ScrollController _scrollController;
  late AnimationController _animationController;
  bool _isRefreshing = false;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    // getNavList();
    getBookList();
    _scrollController = ScrollController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        isLoading = true;
        page = page + 1;
        getBookList();
      }
    });
  }

  /// 获取侧边栏导航数据
  Future<void> getNavList() async {
    final result = await _api.advancedRetrievalParams({
      "advancedRetrievalParams": Uri.encodeComponent(jsonEncode([])),
      "sourceType": '100',
      "categoryType": ''
    });
  }

  ///获取图书列表
  Future<void> getBookList() async {
    Map<String, dynamic> body = {
      "advancedRetrievalParams": [],
      "order": "asc",
      "page": page.toString(),
      "rows": "10",
      "sort": "sourceId"
    };
    final result = await _api.selectBookPropertiesList(body);
    if (result['code'] == 0) {
      List arr = result['data']['rows'];
      setState(() {
        bookList = [...bookList, ...arr];
      });
    }
  }

  void clickItem(index) {
    final item = bookList[index];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PreferredSize(
            preferredSize: const Size.fromHeight(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.white,
              child: Center(
                child: Text(
                  item['title'],
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 300;
    print(width);
    return bookList.isNotEmpty
        ? AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (BuildContext animatedContext, int index) {
                  if (index == bookList.length - 1 && isLoading) {
                    return const SizedBox(
                        height: 80,
                        child: CupertinoActivityIndicator(
                          color: Colors.orange,
                          radius: 15.0,
                        ));
                  }
                  return Container(
                      width: width,
                      constraints: BoxConstraints(maxWidth: width),
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                          onTap: () => clickItem(index),
                          child: Row(
                            verticalDirection: VerticalDirection.up,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.network(
                                "http://${Api.BASE_URL}:${Api.PORT}/img/${bookList[index]['filePath']}",
                                fit: BoxFit.contain,
                                errorBuilder: (
                                  BuildContext context,
                                  Object error,
                                  StackTrace? stackTrace,
                                ) {
                                  return Image.asset(
                                    defaultImage.assetName,
                                    fit: BoxFit.contain,
                                    height: 150,
                                    width: 100,
                                  );
                                },
                                height: 150,
                                width: 100,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    Text(
                                      bookList[index]['title'] +
                                          bookList[index]["collectionPlace"],
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.ltr,
                                      textWidthBasis: TextWidthBasis.parent,
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      bookList[index]['title'] +
                                          bookList[index]["collectionPlace"],
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                      textWidthBasis: TextWidthBasis.parent,
                                      textDirection: TextDirection.ltr,
                                    ),
                                    Text(
                                      bookList[index]["collectionPlace"],
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                      textWidthBasis: TextWidthBasis.parent,
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          )));
                },
                controller: _scrollController,
              );
            })
        : const Text(
            "载入中...",
            textDirection: TextDirection.ltr,
          );
  }
}
