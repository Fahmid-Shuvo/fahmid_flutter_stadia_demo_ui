import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia_demo_app/common/content_heading_widget.dart';
import 'package:stadia_demo_app/common/last_played_game_tile_widget.dart';
import 'package:stadia_demo_app/common/rounded_image_widget.dart';
import 'package:stadia_demo_app/image_asset.dart';
import 'package:stadia_demo_app/model/last_played_game.dart';
import 'package:stadia_demo_app/styleguide/colors.dart';
import '../styleguide/text_styles.dart';
import '../model/friends.dart';
import '../pages/secondary_home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.18,
              child: SvgPicture.asset(
                logo,
                height: logoHeight,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: primaryTextColor,
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondaryHomePage()));
                        },
                      ),
                      Icon(
                        Icons.search,
                        color: primaryTextColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            RoundedImageWidget(
                              ranking: 42,
                              imagePath: player1,
                              showRanking: true,
                              isOnline: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hello',
                                      style: userNameTextStyle,
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(
                                      text: 'Jon Snow',
                                      style: userNameTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Hours Played',
                                        style: hoursPlayedLabelTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '420 hours',
                                  style: hoursPlayedTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(heading: 'Last Played Game'),
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                          gameProgress: lastPlayedGames[i].gameProgress,
                        ),
                      ContentHeadingWidget(heading: 'Friends'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < friends.length; i++)
                          RoundedImageWidget(
                            imagePath: friends[i].imagePath,
                            isOnline: friends[i].isOnline,
                            name: friends[i].name,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
