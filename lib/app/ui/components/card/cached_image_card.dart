import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedImageCard({
  required String imageUrl,
  required double height,
  required double width,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => customLoadingIndicator(),
    errorWidget: (context, url, error) => errorCard(),
    width: width,
    height: height,
    fit: fit ?? BoxFit.contain,
    fadeInDuration: const Duration(milliseconds: 300),
    fadeOutDuration: const Duration(milliseconds: 300),
    placeholderFadeInDuration: const Duration(milliseconds: 300),
  );
}
