part of 'remote_article_bloc.dart';

@immutable
sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});
  @override
  List<Object> get props => [articles!, error!];
}

final class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}
final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> articles) : super(articles:articles);

}
final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error:error);

}
