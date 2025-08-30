
import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }


}