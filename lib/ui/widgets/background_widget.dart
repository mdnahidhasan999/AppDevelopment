import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/asset_paths.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetPaths.backgroundSvg,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Center(
          child: SvgPicture.asset(
            AssetPaths.appLogoSvg,
            width: 140,
          ),
        ),
      ],
    );
  }
}
