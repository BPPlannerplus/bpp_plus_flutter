import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCard extends StatefulWidget {
  const CachedImageCard({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.fit,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  _CachedImageCardState createState() => _CachedImageCardState();
}

class _CachedImageCardState extends State<CachedImageCard> {
  late String _imageUrl;

  @override
  void didChangeDependencies() {
    _imageUrl = widget.imageUrl;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      placeholder: (context, url) => customLoadingIndicator(),
      errorWidget: (context, url, error) => errorCard(),
      width: widget.width,
      height: widget.height,
      fit: widget.fit ?? BoxFit.contain,
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
      placeholderFadeInDuration: const Duration(milliseconds: 300),
    );
  }
}
