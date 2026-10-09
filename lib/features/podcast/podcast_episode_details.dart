import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/app_texts.dart';
import '../home/screens/notification/notification.dart';

class PodcastEpisodeDetails extends StatefulWidget {

  final String albumCoverRef;

  const PodcastEpisodeDetails({super.key, required this.albumCoverRef});

  @override
  State<PodcastEpisodeDetails> createState() => _PodcastEpisodeDetailsState();
}

class _PodcastEpisodeDetailsState extends State<PodcastEpisodeDetails> {

  final List<BottomSheetItemModel> _bottomSheetItems = [
    BottomSheetItemModel(icon: CupertinoIcons.music_note_2, label: "Add to playlist"),
    BottomSheetItemModel(icon: Icons.download_for_offline_outlined, label: "Download"),
    BottomSheetItemModel(icon: Icons.check, label: "Mark as played"),
    BottomSheetItemModel(icon: Icons.share, label: "Share"),
    BottomSheetItemModel(icon: Icons.mic, label: "Go to podcast"),
    BottomSheetItemModel(icon: CupertinoIcons.plus, label: "Follow")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: const Color(0xEE5E6361).withValues(alpha: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.white,
              ),

              IconButton(
                onPressed: () => _showPodcastBottomSheet(),
                icon: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Podcast primary details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xEE606462).withValues(alpha: 1),
                    Color(0xEE121212).withValues(alpha: 0)
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(widget.albumCoverRef),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: AppTexts.bold(
                      text: "How much should we depend on our Nuclear power plants?",///Todo: from backend
                      size: 32.0,
                      color: Colors.white
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: AppTexts.bold(
                      text: "Maha Bharat with Dhruv Rathee",///Todo: from backend
                      size: 14,
                      color: Colors.white
                    ),
                    subtitle: AppTexts.medium(
                      text: "27-APR-2022 • 23 MINS",///Todo: from backend
                      size: 10,
                      color: AppColors.spotifyGrey,
                    ),
                  ),

                  ///Action buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          onPressed: () {
                            ///Todo: Play song
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.spotifyGreen,
                            padding: const EdgeInsets.symmetric(horizontal: 44.0)
                          ),
                          child: AppTexts.bold(
                            text: "Play",
                            size: 14,
                            color: AppColors.spotifyBlack
                          )
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ///Todo: share
                              },
                              icon: Icon(
                                Icons.share,
                                color: AppColors.spotifyGrey,
                              )
                            ),

                            IconButton(
                              onPressed: () {
                                ///Todo: add episode
                              },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.spotifyGrey,
                              )
                            ),

                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                ///Todo: download episode
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Icon(
                                Icons.download_for_offline_outlined,
                                color: AppColors.spotifyGrey,
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  ///Episode desc
                  Text.rich(
                    style: TextStyle(
                      color: AppColors.spotifyGrey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "In 2022, we still haven’t met the goals we set for our Nuclear plants in...the 1950s. What happened? And how much should we depend on our nuclear energy? Learn more about your ad choices. \nVisit ",///Todo: from backend
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white
                          ),
                          text: "podcastchoices.com/adchoices"
                        )
                      ]
                    )
                  ),

                  const SizedBox(height: 16.0),

                  AppTexts.medium(
                    text: "27-APR-2022 • 23 MINS",///Todo: from backend
                    size: 10,
                    color: AppColors.spotifyGrey
                  )
                ],
              ),
            ),

            SizedBox(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      ///Todo:
                    },
                    leading: AppTexts.medium(
                      text: "Episode transcript",
                      size: 14.0,
                      color: Colors.white
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ),

                  Container(
                    height: 375,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.albumCoverRef),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  ListTile(
                    onTap: () => Navigator.of(context).pop(),
                    leading: AppTexts.medium(
                      text: "See all episodes",
                      size: 14.0,
                      color: Colors.white
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ///Leave a space at bottom
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  void _showPodcastBottomSheet() {
    showModalBottomSheet(
        backgroundColor: AppColors.spotifyBlack.withValues(alpha: 1),
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .8
        ),
        context: context,
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            decoration: BoxDecoration(),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Cover photo
                  SizedBox(
                    width: 148,
                    child: Column(
                      children: [
                        Container(
                          height: 148,
                          width: 148,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.albumCoverRef),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xEEFF1155)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ImageIcon(
                                    AssetImage(AppAssets.appIcon),
                                    color: Colors.white,
                                  ),
                                ),

                                Expanded(
                                  child: ImageIcon(
                                    AssetImage(AppAssets.musicBars),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Title & subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: [
                        AppTexts.bold(
                            text: "Unholy (feat. Kim Petras)",
                            size: 16.0,
                            color: Colors.white
                        ),

                        AppTexts.regular(
                            text: "Sam Smith & Kim Petras",
                            size: 14.0,
                            color: AppColors.spotifyGrey
                        )
                      ],
                    ),
                  ),

                  ///Action tiles
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_bottomSheetItems.length, (index) {

                      final item = _bottomSheetItems[index];

                      return ListTile(
                        onTap: () {
                          ///Todo: Perform the action
                        },
                        leading: Icon(
                          item.icon,
                          color: AppColors.spotifyGrey,
                        ),
                        title: AppTexts.bold(
                            text: item.label,
                            size: 14,
                            color: Colors.white
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
