import 'package:dermascan/app/data/article.dart';
import 'package:dermascan/app/services/dio.dart';
import 'package:get/get.dart';

import '../../../utils/logger.dart';

class ArticlesController extends GetxController {
  var articles = <Article>[].obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      var response = await apiServiceWithToken.get('/articles');
      if (response.statusCode == 200) {
        var data = List<Article>.from(response.data['resultDatas'].map((x) => Article.fromJson(x)).toList());
        articles.addAll(data);
        update();
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
