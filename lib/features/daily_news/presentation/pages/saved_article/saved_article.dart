import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/widgets/articlewidget.dart';
import 'package:cleanarchitecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedArticles extends StatelessWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(
          const GetSavedArticleEvent()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body:  _buildBody(),
      ),
    );
  }
  PreferredSizeWidget _buildAppBar(){
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
  Widget _buildBody(){
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is LocalArticleDone) {
          return _buildArticlesList(state.article!);
        }
        return const SizedBox();
      }
    );
  }
  Widget _buildArticlesList(List<ArticleEntity> articles){
    if(articles.isEmpty){
      return const Center(child: Text("No articles saved"),);
    }
    return ListView.builder(
      itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ArticleWidget(
            article: article,
            isRemovable: true,
            onRemove: () =>_onRemoveArticle(context,article),
            onArticlePressed: () => _onArticlePressed(context,article),
          );
        }
    );
  }
  void _onRemoveArticle(BuildContext context,ArticleEntity article){
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticleEvent(article));
  }
  void _onArticlePressed(BuildContext context,ArticleEntity article){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ArticleDetailView(article: article,),));
  }
}
