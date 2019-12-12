import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/services/theme_service.dart';
import 'package:provider_arc/provider_setup.dart';
import 'package:provider_arc/ui/router.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: StreamBuilder<bool>(
          stream: themeService.theme,
          builder: (context, snapshot) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: snapshot.hasData && snapshot.data == true
                  ? ThemeData.dark()
                  : ThemeData.light(),
              initialRoute: RoutePaths.Login,
              onGenerateRoute: Router.generateRoute,
            );
          }),
    );
  }
}
