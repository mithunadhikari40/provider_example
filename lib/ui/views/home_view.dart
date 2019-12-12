import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/theme_service.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';
import 'package:provider_arc/ui/widgets/posts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
     return Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                themeService.changeTheme(true);
                //todo change the theme of the application
              },
              icon: Icon(Icons.track_changes),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Welcome ${user.name} ",
                style: headerStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Here are all of your posts",
                style: subHeaderStyle,
              ),
            ),
            UIHelper.verticalSpaceSmall,
            Flexible(
              fit: FlexFit.loose,
              child: Posts(),
            )
          ],
        ));
  }
}
