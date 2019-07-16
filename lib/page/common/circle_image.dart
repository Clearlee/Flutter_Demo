import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';

class CircleImage extends StatelessWidget {
  double width = 0;
  double height = 0;
  BoxFit fit;
  String url;
  BoxShape shape;

  String placeHolder;

  CircleImage(
      {this.url,
      this.width,
      this.height,
      this.fit: BoxFit.cover,
      this.shape: BoxShape.circle,
      this.placeHolder: 'profile_photo'});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      shape: shape,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Image.asset(
              Constant.getAssetImg(placeHolder),
              fit: fit,
            );
            break;
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: fit,
              width: width,
              height: height,
            );
            break;
          case LoadState.failed:
            return Image.asset(
              Constant.getAssetImg(placeHolder),
              fit: fit,
            );
            break;
        }
        return Container();
      },
    );
  }
}
