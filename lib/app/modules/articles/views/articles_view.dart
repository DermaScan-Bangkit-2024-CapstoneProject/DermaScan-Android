import 'package:dermascan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  ArticlesController controller = Get.put(ArticlesController());

  ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Article> filteredArticles = selectedCategory == null
    //     ? articles
    //     : articles
    //         .where((article) => article.category == selectedCategory)
    //         .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        actions: [
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     setState(() {
          //       selectedCategory = value;
          //     });
          //   },
          //   itemBuilder: (context) {
          //     return [
          //       PopupMenuItem(value: null, child: Text('All')),
          //       PopupMenuItem(value: 'Health', child: Text('Health')),
          //       PopupMenuItem(value: 'Technology', child: Text('Technology')),
          //       // Add more categories as needed
          //     ];
          //   },
          // ),
        ],
      ),
      body: GetBuilder<ArticlesController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return ListTile(
              title: Text("$index ${article.title}"),
              onTap: () {
                Get.toNamed(Routes.ARTICLE_DETAIL,
                    arguments: {'article': article});
              },
            );
          },
        );
      }),
    );
  }
}
