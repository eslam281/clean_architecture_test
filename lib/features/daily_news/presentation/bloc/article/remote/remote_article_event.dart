part of 'remote_article_bloc.dart';

@immutable
sealed class RemoteArticleEvent {
  const RemoteArticleEvent();
}
class GetArticleEvent extends RemoteArticleEvent{
  const GetArticleEvent();
}
