import 'package:cleanarchitecture/features/daily_news/data/repository/article_repsoitory.dart';
import 'package:cleanarchitecture/features/daily_news/data/sources/local/DAO/app_database.dart';
import 'package:cleanarchitecture/features/daily_news/data/sources/remote/news_api_service.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(
    Dio()
  );

  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl())
  );
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerFactory<RemoteArticleBloc>(
      ()=> RemoteArticleBloc(sl())
  );

}