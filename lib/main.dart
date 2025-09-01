import 'package:cleanarchitecture/config/theme/app_themes.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:cleanarchitecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) =>
      sl()..add(const GetArticleEvent()),
      child: MaterialApp(
          theme: theme(),
          home: const DailyNews()
      ),
    );
  }
}