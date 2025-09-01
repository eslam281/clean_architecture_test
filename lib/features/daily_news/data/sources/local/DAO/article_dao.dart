
import 'package:cleanarchitecture/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao{

  @Insert()
  Future<void> insertArticles(ArticleModel article);

  @delete
  Future<void> deleteArticles(ArticleModel article);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();

}