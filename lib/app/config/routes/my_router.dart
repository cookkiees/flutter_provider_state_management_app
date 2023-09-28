import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../modules/article/domain/entities/article_data_entity.dart';
import '../../modules/article/presentation/pages/article_detail_screen.dart';
import '../../modules/article/presentation/pages/article_screen.dart';
import '../../modules/article/presentation/provider/article_procider.dart';
import '../../modules/counter/pages/counter_screen.dart';
import '../../modules/counter/provider/counter_provider.dart';
import '../../modules/main/main_screen.dart';
import '../../modules/user/presentation/pages/user_screen.dart';
import '../../modules/user/presentation/provider/user_provider.dart';
import 'my_routes.dart';

class MyRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static router() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/user',
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainScreen(navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: MyRoutes.user,
                  path: '/user',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => UserProvider(),
                    child: const UserScreen(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: MyRoutes.counter,
                  path: '/counter',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => CounterProvider(),
                    child: const CounterScreen(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: MyRoutes.article,
                  path: '/article',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => ArticleProvider(),
                    child: const ArticleScreen(),
                  ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      name: MyRoutes.articleDetail,
                      path: 'article-detail/:author',
                      builder: (context, state) {
                        state.pathParameters['author'];
                        final article = state.extra as ArticleDataEntity;
                        return ChangeNotifierProvider(
                          create: (context) => ArticleProvider(),
                          child: ArticleDetailScreen(article: article),
                        );
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
