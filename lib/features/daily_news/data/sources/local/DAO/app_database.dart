import 'dart:async';

import 'package:cleanarchitecture/features/daily_news/data/models/article.dart';
import 'package:cleanarchitecture/features/daily_news/data/sources/local/DAO/article_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';
@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDao;


}