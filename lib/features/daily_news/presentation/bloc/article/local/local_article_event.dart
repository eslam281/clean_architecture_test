part of 'local_article_bloc.dart';

@immutable
sealed class LocalArticleEvent extends Equatable{
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

final class GetSavedArticleEvent extends LocalArticleEvent{
  const GetSavedArticleEvent();
}

final class SaveArticleEvent extends LocalArticleEvent{
  const SaveArticleEvent( ArticleEntity article) : super(article: article);
}

final class RemoveArticleEvent extends LocalArticleEvent{
  const RemoveArticleEvent( ArticleEntity article) : super(article: article);
}