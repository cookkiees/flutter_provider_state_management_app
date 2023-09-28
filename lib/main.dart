import 'package:flutter/material.dart';

import 'app/config/routes/my_router.dart';
import 'app/config/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider',
      theme: myTheme(),
      routerConfig: MyRouter.router(),
    );
  }
}
