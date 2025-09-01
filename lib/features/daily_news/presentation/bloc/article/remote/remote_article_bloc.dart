import 'package:bloc/bloc.dart';
import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  
  final GetArticleUseCase _getArticleUseCase;
  
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticleEvent>(onGetArticles );
  }
  void onGetArticles(GetArticleEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataError) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
