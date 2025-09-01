
import 'dart:io';

import 'package:cleanarchitecture/core/constants/constants.dart';
import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/data/sources/remote/news_api_service.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async{
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey,
          category: categoryQuery,
          country: countryQuery
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              error: httpResponse.response.statusMessage,
            )
        );
      }
    }on DioException catch (e) {
      return DataError(e);
    }
  }
}