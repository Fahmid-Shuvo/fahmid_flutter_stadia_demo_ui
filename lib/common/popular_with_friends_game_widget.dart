import 'package:flutter/material.dart';
import '../image_asset.dart';
import '../styleguide/text_styles.dart';

class PopularWithFriendsWidget extends StatelessWidget {
  final String imagePath;
  PopularWithFriendsWidget({@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(imagePath),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                elevation: 8,
                color: Colors.white,
                child: Text(
                  'Play',
                  style: playWhiteTextStyle,
                ),
                onPressed: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
