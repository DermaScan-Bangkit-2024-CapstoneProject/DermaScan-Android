import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  ArticleDetailView({super.key});

  @override
  final ArticleDetailController controller = Get.put(ArticleDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.article.title),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ReadHistoryPage()),
              // );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(controller.article.content),
          ],
        ),
      ),
    );
  }
}
