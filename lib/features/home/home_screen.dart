import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_texts.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String _getGreetingText() {

    int hour = DateTime.now().hour;

    switch (hour) {
      case < 7:
        return "Good Morning";
      case < 12:
        return "Good Afternoon";
      case < 17:
        return "Good evening";
      default:
        return "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Leave a space at the top
              const SizedBox(height: 32.0),

              ///Salutation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTexts.bold(
                      text: _getGreetingText(),
                      size: 24.0
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ///Todo: Change current playing platform
                          },
                          icon: Image.asset(
                            AppAssets.activeNotificationIcon,
                            height: 24.0,
                          )
                        ),
                        IconButton(
                          onPressed: () {
                            ///Todo: Change current playing platform
                          },
                          icon: ImageIcon(
                            AssetImage(AppAssets.recentsIcon),
                            color: Colors.white
                          )
                        ),
                        IconButton(
                          onPressed: () {
                            ///Todo: Change current playing platform
                          },
                          icon: ImageIcon(
                            AssetImage(AppAssets.settingsIcon),
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),

              ///Recently played
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Recently played",
                        size: 24.0
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {

                          final isFirst = index == 0;

                          final isArtist = (index % 2) == 0;

                          if (isArtist && !isFirst) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 114,
                                    width: 114,
                                    decoration: BoxDecoration(
                                      color: AppColors.spotifyGrey,
                                      shape: BoxShape.circle
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.bold(
                                    text: "Michael Jackson",
                                    size: 12.0
                                  )
                                ],
                              ),
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 114,
                                  width: 114,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      gradient: isFirst
                                          ? LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            const Color(0xEE4202F5).withValues(alpha: .74),
                                            const Color(0xEECA9AF0).withValues(alpha: .50),
                                            const Color(0xEEC0EAC9).withValues(alpha: .74)
                                          ]
                                      )
                                          : null
                                  ),
                                  child: isFirst
                                      ? Center(
                                    child: Image.asset(
                                      AppAssets.filledFavoriteIcon,
                                      height: 42,
                                    ),
                                  )
                                      : SizedBox.shrink(),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "Liked Songs",
                                  size: 12.0
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),

              ///To Get You Started
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "To get you started",
                        size: 24.0
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {

                          final overlayColor = Color.fromARGB(
                            255,
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256)
                          ).withValues(alpha: .9);

                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                              width: 144,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 144,
                                    width: 144,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppAssets.dummyArtistImage1)
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          width: 110,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                AppAssets.getStartedTopOverlay,
                                                width: 120,
                                                color: overlayColor,
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: Image.asset(
                                                  AppAssets.getStartedBottomOverlay,
                                                  color: overlayColor
                                                ),
                                              ),

                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: AppTexts.bold(
                                                    text: "Daily Mix $index"
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        color: AppColors.spotifyGrey,
                                        fontSize: 12.0
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Drake, Michael Jackson, Dua Lipa"
                                        ),

                                        TextSpan(
                                          text: " and more"
                                        ),
                                      ]
                                    )
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),

              ///Your Shows
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Your shows",
                        size: 24.0
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
                          return Container(
                            width: 144,
                            margin: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Show thumbnail
                                Container(
                                  height: 144,
                                  width: 144,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyShowsImage1)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          // color: Colors.green
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Image.asset(
                                                AppAssets.spotifyTags,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0, right: 4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 13.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 16.0),

                                ///Show description
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppTexts.medium(
                                      text: "Business",
                                      size: 10.0,
                                      color: AppColors.spotifyGreen
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: CircleAvatar(
                                        radius: 1.5,
                                        backgroundColor: AppColors.spotifyGreen
                                      ),
                                    ),

                                    AppTexts.medium(
                                      text: "Technology",
                                      size: 10.0,
                                      color: AppColors.spotifyGreen
                                    ),
                                  ],
                                ),

                                AppTexts.bold(
                                  text: "The Ranveer Show",
                                  color: Colors.white,
                                  size: 12.0
                                ),

                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: AppColors.spotifyGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Show . "
                                      ),
                                      TextSpan(
                                        text: "BeerBiceps aka Ranveer Allahbadia"
                                      )
                                    ]
                                  )
                                )

                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),

              ///Featured charts
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Featured charts",
                        size: 24.0
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(12, (index) {

                          final bgColor = Color.fromARGB(
                            255,
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256),
                          );

                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                              width: 144,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 144,
                                    height: 144,
                                    decoration: BoxDecoration(
                                      color: bgColor
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ImageIcon(
                                                AssetImage(AppAssets.appIcon),
                                                size: 12.0,
                                              ),
                                            ),

                                            SizedBox(
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AppTexts.bold(
                                                        text: "TOP\nSONGS",
                                                        color: Colors.white
                                                    ),

                                                    AppTexts.bold(
                                                        text: "GLOBAL",
                                                        color: Colors.white.withValues(alpha: .6)
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              height: 24,
                                              width: 24,
                                              color: Colors.white,
                                              child: Transform.rotate(
                                                angle: 150,
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: bgColor,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 4.0),

                                            AppTexts.medium(
                                              text: "Weekly Music Charts",
                                              size: 10.0,
                                              color: Colors.white
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),


              ///Leave a space at the bottom
              const SizedBox(height: 240.0),
            ],
          ),
        ),
      ),
    );
  }
}
