import 'package:flutter/material.dart';
import 'package:flutter_app/bean/product_data.dart';

import '../base_list_bloc.dart';

class ProductBloc extends BaseListBloc<ProductData> {
  @override
  getData(bool isLoad) {
    // TODO: implement getData

    if (!isLoad) {
      list.clear();
      for (var i = 0; i < 9; i++) {
        list.add(ProductData(
            'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
            '饶雪漫$i',
            '2 周前',
            '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
            5,
            12.5,
            true,
            productImg:
                'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'));
      }
    } else {
      for (var i = 0; i < 9; i++) {
        list.add(ProductData(
            'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
            '饶雪漫$i',
            '2 周前',
            '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
            5,
            12.5,
            true,
            productImg:
                'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'));
      }
    }
  }

  @override
  void initState(BuildContext context) {
    // TODO: implement initState

    print('initState');

    if (list == null) {
      list = new List();
    }else{
      list.clear();
    }

    for (var i = 0; i < 9; i++) {
      list.add(ProductData(
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          '饶雪漫1',
          '2 周前',
          '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
          5,
          12.5,
          true,
          productImg:
              'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'));
    }

    print('lenght = ${list.length}');
  }
}
