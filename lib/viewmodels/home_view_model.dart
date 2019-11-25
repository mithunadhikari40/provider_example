import 'package:provider_arc/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  start() {
    setBusy(true);
  }

  end() {
    setBusy(false);
  }
}
