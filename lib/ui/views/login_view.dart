import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/base_widget.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/widgets/login_header.dart';
import 'package:provider_arc/viewmodels/login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        authenticationService: Provider.of(context),
      ),
      builder: (BuildContext context, LoginViewModel model, Widget child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: _buildBody(model, child),
        );
      },
      child: LoginHeader(
        controller: _controller,
      ),
    );

//
//    return ChangeNotifierProvider<LoginViewModel>.value(
//      value: LoginViewModel(
//        authenticationService: Provider.of(context),
//        // Inject authentication service setup in the provider_setup
//      ),
//      child: Consumer<LoginViewModel>(
//        child: LoginHeader(
//          controller: _controller,
//        ),
//        builder: (BuildContext context, LoginViewModel model, Widget child) {
//          return
//        },
//      ),
//    );
  }

  Column _buildBody(LoginViewModel model, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        LoginHeader(
//          controller: _controller,
//        ),
        child,
        model.busy
            ? CircularProgressIndicator()
            : FlatButton(
                color: Colors.white,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  final loginSuccess = await model.login(_controller.text);
                  if (loginSuccess)
                    Navigator.pushNamed(context, RoutePaths.Home);
                },
              )
      ],
    );
  }

  Future _performLogin() async {}
}
