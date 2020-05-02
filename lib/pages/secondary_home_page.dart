import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stadia_demo_app/common/content_heading_widget.dart';
import '../image_asset.dart';
import '../styleguide/colors.dart';
import '../styleguide/text_styles.dart';
import '../model/last_played_game.dart';
import '../common/popular_with_friends_game_widget.dart';

class SecondaryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  game_sekiro,
                  fit: BoxFit.fitHeight,
                  height: 360,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.37),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 10.0),
                            child: InkWell(
                              child: Icon(Icons.menu, color: Colors.white),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'New Game',
                                  style: newGameTextStyle,
                                ),
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: 'Sekiro: Shadows Dies Twice',
                                  style: newGameNameTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 40),
                              decoration: BoxDecoration(
                                gradient: appGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text(
                                'Play',
                                style: newGameTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ContentHeadingWidget(
                    heading: 'Popular With Friends',
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < popularWithFriends.length; i++)
                          PopularWithFriendsWidget(
                            imagePath: popularWithFriends[i],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ContentHeadingWidget(heading: 'Continue Playing'),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal:16),
                      height: screenHeight * 0.25,
                      decoration: BoxDecoration(
                        gradient: appGradient,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  lastPlayedGames[0].imagePath,
                                  height: screenHeight * 0.15,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 25,
                                right: 25,
                                bottom: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.red[400],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: lastPlayedGames[0].name,
                                    style: headingTwoTextStyle.copyWith(color:Colors.white),
                                  ),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                    text:
                                        '${lastPlayedGames[0].hoursPlayed} Hours Played',
                                    style: bodyTextStyle.copyWith(color:Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
