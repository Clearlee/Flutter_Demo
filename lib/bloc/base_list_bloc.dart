import 'base_bloc.dart';

abstract class BaseListBloc<T> extends BaseBloc<List<T>> {
  List<T> list;

  int page = 1;

  getData(bool isLoad);

  refresh() {
    print('refresh');
    page = 1;
    return getData(false);
  }

  loadMore() {
    print('loadMore');
    page++;
    return getData(true);
  }
}
