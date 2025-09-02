import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:cleanarchitecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleDetailView extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleDetailView({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body:  _buildBody(),
        floatingActionButton:_buildFloatingActionButton() ,
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
      title: const Text("Saved Articles",style: TextStyle(color: Colors.black),),
    );
  }

  Widget _buildBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArtivleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ])
    );
  }
  Widget _buildArtivleTitleAndDate(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article!.title!,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Butler"),),

            const SizedBox(height: 14),

            Row(
              children: [
                Icon(Icons.access_time_outlined,size: 16,),
                SizedBox(width: 4,),
                Text(article!.publishedAt!,style: TextStyle(fontSize: 12),)
              ],
            )
          ],)
    );
  }
  Widget _buildArticleImage(){
    return Container(
      height: 250,
      width: double.maxFinite,
      margin:const EdgeInsets.only(top: 14),
      child: CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget _buildArticleDescription(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
      child: Text("${article!.description ??""} \n\n ${article!.content ?? ""}",
        style: TextStyle(fontSize: 16,),)
    );
  }
  Widget _buildFloatingActionButton(){
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () {
          BlocProvider.of<LocalArticleBloc>(context).add(SaveArticleEvent(article!));
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Article saved successfully"),

              )
          );
        },
          child: Icon(Icons.bookmark_outline_outlined)
      )
    );
  }
}
