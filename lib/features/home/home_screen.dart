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

              ///Get Started
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
            ],
          ),
        ),
      ),
    );
  }
}
