import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:_buildAppbar() ,
      body: _buildBody(),
    );
  }
  _buildAppbar(){
    return AppBar(
      title: const Text("Daily News",style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  }
  _buildBody(){
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemCount: state.articles?.length ?? 0,
            itemBuilder: (context, index) {
              final article = state.articles![index];
              return ListTile(
                leading: article.urlToImage != null
                    ? Image.network(
                  article.urlToImage!,
                  width: 60,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.article),
                title: Text(
                  article.title ?? "No title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  article.description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // ممكن تفتح صفحة تفاصيل أو WebView هنا
                  // Navigator.push(...)
                },
              );
            },
          );
        }

        if (state is RemoteArticleError) {
          return Center(child: Text(state.error.toString()));
        }
        return const SizedBox();
      },
    );
  }
}
