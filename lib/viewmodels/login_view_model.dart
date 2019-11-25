import 'package:flutter/material.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userId) async {
    setBusy(true);
    var id = int.tryParse(userId);
    var response = await _authenticationService.login(id);
    return response;
  }
}
