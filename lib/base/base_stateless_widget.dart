import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/base_bloc.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';

abstract class BaseStatelessWidget<B extends BaseBloc> extends StatelessWidget {
  B bloc;

  Widget buildWidget(BuildContext context);

  void initData();

  @override
  Widget build(BuildContext context) {

    bloc = BlocProvider.of<B>(context);

    initData();

    return Scaffold(
      backgroundColor: Colors.white,
      body: buildWidget(context),
    );
  }
}
