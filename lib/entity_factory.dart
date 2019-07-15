import 'bean/recommend_guide_data_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "RecommendGuideDataEntity") {
      return RecommendGuideDataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}