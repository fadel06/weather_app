import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

import '../../common/styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
          width: double.infinity,
          height: 350,
          padding: const EdgeInsets.all(16),
          color: kPrimaryColor,
          child: Center(
            child: Column(
              children: [
                Lottie.asset('assets/animations/LocationWeather.json',
                    height: 200),
                Text(
                  "Terawang",
                  style: myTextTheme.headline4?.apply(color: Colors.white),
                ),
                Text(
                  "Temukan perkiraan cuaca kota anda disini",
                  style: myTextTheme.subtitle2?.apply(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
