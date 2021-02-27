import 'package:flutter/material.dart';
import 'package:udemy/blocs/Bloc.dart';

// 1
class BlocProviderSpecial<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProviderSpecial({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  // 2
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProviderSpecial<T>>();
    //final BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    final BlocProviderSpecial<T> provider = context.findAncestorWidgetOfExactType<BlocProviderSpecial<T>>();

    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderSpecialState();
}

class _BlocProviderSpecialState extends State<BlocProviderSpecial> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
