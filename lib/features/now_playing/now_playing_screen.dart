import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/devices/connected_devices_screen.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {

  void _animatoToPage() {
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const ConnectedDevicesScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                  position: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut
                  ).drive(
                      Tween(
                          begin: Offset(0, 1),
                          end: .zero
                      )
                  ),
                  child: child
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.spotifyBlack.withValues(alpha: .6),
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xEE676E75).withValues(alpha: 1)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: ImageIcon(
                  AssetImage(AppAssets.keyboardArrowDownIcon),
                  color: Colors.white,
                )
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTexts.regular(
                    text: "PLAYING FROM ${'ALBUM'}",///Todo:
                    size: 10.0,
                    color: Colors.white
                  ),

                  AppTexts.bold(
                    text: '${"Dangerous"}',///Todo: from backend
                    size: 12.0,
                    color: Colors.white
                  )
                ],
              ),

              IconButton(
                onPressed: () {
                  ///Todo:
                },
                icon: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Colors.white,
                )
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: Container(
        // padding: const .symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: .topCenter,
           end: .bottomCenter,
           colors: [
             const Color(0xEE676E75).withValues(alpha: 1),
             const Color(0xEE121212).withValues(alpha: 1)
           ]
         )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Cover image
              Container(
                height: 343,
                width: double.infinity,
                margin: const .symmetric(vertical: 64, horizontal: 16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.dummyMjCover),
                    fit: .cover
                  )
                ),
              ),

              ///Now playing
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      // contentPadding: .zero,
                      title: AppTexts.bold(
                        text: '${"You Rock My World"}',///Todo: from backend
                        size: 20.0,
                        color: Colors.white
                      ),
                      subtitle: AppTexts.bold(
                        text: '${"Michael Jackson"}',///Todo: from backend
                        size: 14.0,
                        color: AppColors.spotifyGrey
                      ),
                      trailing: InkWell(
                        onTap: () {
                          ///Todo: Like/Unlike song
                        },
                        child: ImageIcon(
                          AssetImage(
                            AppAssets.filledFavoriteIcon
                          ),
                          color: AppColors.spotifyGreen,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    ///Slider
                    Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Slider(
                            value: .0,///Todo: when player is in action
                            onChanged: (val) {
                              ///Todo:
                            },
                            padding: .only(left: 8.0),
                            thumbColor: Colors.white,
                            activeColor: Colors.white,
                            inactiveColor: AppColors.spotifyButtonBgColor,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTexts.medium(
                                text: '${"0:00"}',///Todo: from backend
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              ),

                              AppTexts.medium(
                                text: '${"0:00"}',///Todo: from backend
                                size: 10.0,
                                color: AppColors.spotifyGrey
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    ///Now playing action buttons
                    Padding(
                      padding: const .all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              ///Todo:
                            },
                            icon: ImageIcon(
                              AssetImage(AppAssets.shuffleIcon),
                              color: Colors.white,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              ///Todo:
                            },
                            icon: ImageIcon(
                              AssetImage(AppAssets.prevIcon),
                              color: Colors.white,
                              size: 32.0,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              ///Todo:
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: .all(16.0)
                            ),
                            icon: Icon(
                              CupertinoIcons.play_arrow_solid,
                              color: Colors.black,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              ///Todo:
                            },
                            icon: ImageIcon(
                              AssetImage(AppAssets.nextIcon),
                              color: Colors.white,
                              size: 32.0,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              ///Todo:
                            },
                            icon: ImageIcon(
                              AssetImage(AppAssets.repeatIcon),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const .all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => _animatoToPage(),
                            icon: ImageIcon(
                              AssetImage(AppAssets.devicesIcon),
                              color: Colors.white,
                              size: 16,
                            ),
                          ),

                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ///Todo:
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.shareIcon),
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  ///Todo:
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.listIcon),
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              ///Song lyrics
              Container(
                height: 267,
                width: double.infinity,
                margin: const .symmetric(horizontal: 16, vertical: 20),
                padding: const .only(left: 16.0, top: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xEEA57B62).withValues(alpha: 1),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTexts.bold(
                          text: "Lyrics",
                          size: 12.0,
                          color: Colors.white
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ///Todo:
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.spotifyBlack.withValues(alpha: .3)
                              ),
                              icon: ImageIcon(
                                AssetImage(
                                  AppAssets.shareIcon
                                ),
                                color: Colors.white,
                                size: 16.0,
                              )
                            ),

                            const SizedBox(width: 8.0),

                            IconButton(
                              onPressed: () {
                                ///Todo:
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.spotifyBlack.withValues(alpha: .3)
                              ),
                              icon: Transform.flip(
                                flipX: true,
                                child: Icon(
                                  CupertinoIcons.fullscreen,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              )
                            )
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    Expanded(
                      child: SingleChildScrollView(
                        child: AppTexts.bold(
                          text: "The way she came into the place I knew right then and there There was something different about this girl The way she moved  her hair, her face, her lines Divinity in motion The way she came into the place I knew right then and there There was something different about this girl The way she moved  her hair, her face, her lines Divinity in motion",
                          size: 20.0,
                          color: AppColors.spotifyBlack
                        ),
                      ),
                    )
                  ],
                ),
              ),



              ///Leave a space at bottom
              const SizedBox(height: 120.0)
            ],
          ),
        ),
      ),
    );
  }
}
