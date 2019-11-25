import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentService,
  ...dependentServices,
  ...uiConsumableServices
];
List<SingleChildCloneableWidget> independentService = [
  Provider.value(value: Api())
];
List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (BuildContext context, Api api,
        AuthenticationService authenticationService) {
      return AuthenticationService(api: api);
    },
  )
];
List<SingleChildCloneableWidget> uiConsumableServices = [
  StreamProvider<User>(
    builder: (BuildContext context) {
      return Provider.of<AuthenticationService>(context, listen: false).user;
    },
  ),
];
