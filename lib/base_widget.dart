import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/viewmodels/base_model.dart';

class BaseWidget<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;

  final Function(T) onModelReady;

  BaseWidget({Key key, this.model, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseModel> extends State<BaseWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
