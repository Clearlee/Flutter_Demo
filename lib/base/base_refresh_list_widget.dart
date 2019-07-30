import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/base_list_bloc.dart';
import 'package:flutter_app/constant/refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'base_stateless_widget.dart';

abstract class BaseRefreshListWidget<T, B extends BaseListBloc<T>>
    extends BaseStatelessWidget<B> {

  buildItem(BuildContext context, T item);

  GlobalKey<RefreshFooterState> _footerKeyList =
      new GlobalKey<RefreshFooterState>();

  GlobalKey<RefreshHeaderState> _headerKeyList =
      new GlobalKey<RefreshHeaderState>();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return StreamBuilder(
        initialData: bloc.list,
        stream: bloc.stream,
        builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
          return EasyRefresh(
              behavior: ScrollOverBehavior(),
              refreshFooter: Refresh.footerList(_footerKeyList),
              refreshHeader: Refresh.headerList(_headerKeyList),
              onRefresh: () => bloc.refresh(),
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    T data = snapshot.data[index];
                    return buildItem(context, data);
                  }),
              loadMore: () => bloc.loadMore());
        });
  }
}
