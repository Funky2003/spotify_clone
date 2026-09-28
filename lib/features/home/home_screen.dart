import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/home/screens/notification/notification.dart';
import 'package:spotify_clone/features/home/screens/recent/recently_played_screen.dart';
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
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (route) {
                                return const NotificationScreen();
                              })
                            );
                          },
                          icon: Image.asset(
                            AppAssets.activeNotificationIcon,
                            height: 24.0,
                          )
                        ),
                        IconButton(
                          onPressed: () {
                            ///Todo: Change current playing platform
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (route) {
                                return const RecentlyPlayedScreen();
                              })
                            );
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

              ///Try Something New
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Try something else",
                        size: 24.0
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(12, (index) {

                          final startGradientColor = Color.fromARGB(
                            255,
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256),
                          );

                          final endGradientColor = Color.fromARGB(
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
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          startGradientColor.withValues(alpha: .8),
                                          endGradientColor.withValues(alpha: .6)
                                        ]
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ImageIcon(
                                            AssetImage(AppAssets.appIcon),
                                            size: 12.0,
                                            color: Colors.white.withValues(alpha: .2),
                                          ),
                                        ),

                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                AppTexts.bold(
                                                  text: "TOP ${100}",
                                                  color: Colors.white,
                                                  size: 20.0
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                                  child: Divider(
                                                    color: Colors.white.withValues(alpha: .5),
                                                  ),
                                                ),

                                                AppTexts.bold(
                                                  text: "GLOBAL",
                                                  color: Colors.white
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox()
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

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistImage3),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                text: "MORE LIKE",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Michael Jackson",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyArtistImage2)
                                    )
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
                        }),
                      ),
                    )
                  ],
                ),
              ),

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistImage4),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                text: "MORE LIKE",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Selena Gomez",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyArtistImage5)
                                    )
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
                        }),
                      ),
                    )
                  ],
                ),
              ),

              ///Spotify Exclusives
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Spotify Original & Exclusive",
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
                                      image: AssetImage(AppAssets.dummyCoverImage1)
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
                                        text: "Education",
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

                                    Expanded(
                                      child: AppTexts.medium(
                                        text: "Language Learning",
                                        size: 10.0,
                                        color: AppColors.spotifyGreen,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ],
                                ),

                                AppTexts.bold(
                                    text: "Learn Life Skills With Aleena Rais",
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
                                              text: "Aleena Rais"
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

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistImage6),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                text: "MORE LIKE",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Tom Odell",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(AppAssets.dummyArtistImage7)
                                      )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "James Bay",
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

              ///Your Favorites
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Your Favorite",
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
                                        image: AssetImage(AppAssets.dummyCoverImage2)
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
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 12.0,
                                                  color: overlayColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.medium(
                                    text: "Black Adam (Original Motion Picture Soundtrack)",
                                    size: 12.0
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

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistImage8),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                text: "MORE LIKE",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Lily Kershaw",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyCoverImage3)
                                    )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "Roni Alter",
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

              ///Biggest Hits
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Biggest Hits",
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
                                            image: AssetImage(AppAssets.dummyCoverImage4)
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
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 12.0,
                                                  color: overlayColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.medium(
                                    text: "KGF Chapter 2 (Original Motion Picture Soundtrack)",
                                    size: 12.0
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

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistImage1),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                  text: "MORE LIKE",
                                  size: 10.0,
                                  color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Drake",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyArtistImage9)
                                    )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "J. Cole",
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

              ///Made For You
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Made For You",
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
                                            image: AssetImage(AppAssets.dummyCoverImage5)
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
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 12.0,
                                                  color: overlayColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.medium(
                                    text: "Taare Zameen Par",
                                    size: 12.0
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

              ///More Like Artist
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AppAssets.dummyArtistProfileImage1),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                text: "MORE LIKE",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.bold(
                                text: "Shawn Mendes",
                                size: 20.0,
                                color: Colors.white
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyArtistCoverImage1)
                                    )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "Ed Sheeran",
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

              ///Throwback
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: AppTexts.bold(
                        text: "Throwback",
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
                                        image: AssetImage(AppAssets.dummyCoverImage6)
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
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ImageIcon(
                                                  AssetImage(AppAssets.appIcon),
                                                  size: 12.0,
                                                  color: overlayColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.medium(
                                    text: "Arijit Singh, Pritam, A.R. Rahman and more",
                                    size: 12.0
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
