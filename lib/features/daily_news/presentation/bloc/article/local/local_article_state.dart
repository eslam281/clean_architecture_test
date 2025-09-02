part of 'local_article_bloc.dart';

@immutable
sealed class LocalArticleState extends Equatable{
  final List<ArticleEntity>? article;
  const LocalArticleState({this.article});
  @override
  List<Object> get props => [article!];
}

final class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();

}
final class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<ArticleEntity> article) : super(article: article);
}
