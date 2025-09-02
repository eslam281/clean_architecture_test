import 'package:bloc/bloc.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
      this._getSavedArticleUseCase,
      this._saveArticleUseCase,
      this._removeArticleUseCase
      ) : super(LocalArticleLoading()) {
    on<GetSavedArticleEvent>(onGetSavedArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticleEvent event,Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(RemoveArticleEvent removeArticleEvent, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticleEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SaveArticleEvent saveArticleEvent, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticleEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

}