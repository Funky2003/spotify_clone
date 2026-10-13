import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class YourEpisodesScreen extends StatefulWidget {
  const YourEpisodesScreen({super.key});

  @override
  State<YourEpisodesScreen> createState() => _YourEpisodesScreenState();
}

class _YourEpisodesScreenState extends State<YourEpisodesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE27073A).withValues(alpha: .4),
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xEE27073A).withValues(alpha: 1)
          ),
          child: Row(
            children: [
              BackButton(
                color: Colors.white,
              )
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Action center
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    const Color(0xEE350055).withValues(alpha: .6),
                    const Color(0xEE121212).withValues(alpha: 0)
                  ]
                )
              ),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    width: double.infinity,
                    padding: const .symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchBar(
                            onTapOutside: (_) => FocusScope.of(context).unfocus(),
                            elevation: WidgetStatePropertyAll(0),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                              )
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white.withValues(alpha: .1)
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Find in your episodes",
                            hintStyle: WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white
                              )
                            ),
                            textStyle: WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white
                              )
                            ),
                          )
                        ),

                        const SizedBox(width: 8.0),

                        FilledButton(
                          onPressed: () => _showSortBottomSheet(),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white.withValues(alpha: .1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: AppTexts.bold(
                              text: "Sort",
                              size: 12.0,
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: const .only(top: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.bold(
                                text: "Your episodes",
                                size: 24.0,
                                color: Colors.white
                              ),

                              const SizedBox(height: 12.0),

                              AppTexts.medium(
                                text: "${23} episodes",
                                size: 12.0,
                                color: AppColors.spotifyGrey
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ///Todo: Go to settings
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color:AppColors.spotifyGrey
                                )
                              ),

                              IconButton(
                                onPressed: () {
                                  ///Todo: Go to settings
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: AppColors.spotifyGreen,
                                  padding: const .all(16)
                                ),
                                icon: Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color:AppColors.spotifyBlack,
                                  size: 28,
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    margin: const .symmetric(vertical: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...<String>[
                            "Download",
                            "Unplayed",
                            "Continue listening",
                          ].map((label) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  ///Todo: Select this
                                },
                                style: TextButton.styleFrom(
                                  side: BorderSide(
                                    color: const Color(0xEE7F7F7F).withValues(alpha: 1),
                                  ),
                                  padding: const .symmetric(horizontal: 24)
                                ),
                                child: AppTexts.medium(
                                  text: label,
                                  size: 12.0,
                                  color: Colors.white
                                )
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Episodes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(23, (index) {
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const .symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(AppAssets.dummyArtistProfileImage1)
                                          ),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                    ),

                                    const SizedBox(width: 12.0),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AppTexts.medium(
                                              text: "How to be good in UX principles and Knowledge",///Todo: from backend
                                              size: 14.0,
                                              color: Colors.white,
                                              maxLines: 2,
                                              overflow: .ellipsis
                                          ),

                                          const SizedBox(height: 4.0),

                                          AppTexts.medium(
                                              text: "UX Coffee break with UX Anudeep",///Todo: from backend
                                              size: 10.0,
                                              color: AppColors.spotifyGrey,
                                              maxLines: 1,
                                              overflow: .ellipsis
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const .symmetric(vertical: 12.0),
                                child: AppTexts.medium(
                                    text: "Stay tuned to UX Coffee break to learn  UX on a daily basis and eventually, crack your UX interviews. --- Send in a voice message: link here",///Todo: from backend
                                    size: 10.0,
                                    color: AppColors.spotifyGrey,
                                    maxLines: 2,
                                    overflow: .ellipsis
                                ),
                              ),

                              Row(
                                children: [
                                  AppTexts.medium(
                                      text: "19 Mar 22 • 1 hr 35 mins left", ///Todo: from backend
                                      size: 10.0,
                                      color: AppColors.spotifyGrey
                                  ),

                                  const SizedBox(width: 6.0),

                                  SizedBox(
                                    width: 100.0,
                                    child: LinearProgressIndicator(
                                      value: .3,
                                      color: AppColors.spotifyGreen,
                                      backgroundColor: const Color(0xEE2A2A2A),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const .symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        ///Todo: do something
                                      },
                                      icon: Icon(
                                        CupertinoIcons.checkmark_alt_circle_fill,
                                        color: AppColors.spotifyGreen,
                                      )
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        ///Todo: do something
                                      },
                                      icon: Icon(
                                        Icons.download_for_offline,
                                        color: AppColors.spotifyGrey,
                                      )
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        ///Todo: do something
                                      },
                                      icon: Icon(
                                        Icons.share,
                                        color: AppColors.spotifyGrey,
                                      )
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        ///Todo: do something
                                      },
                                      icon: Icon(
                                        CupertinoIcons.ellipsis_vertical,
                                        color: AppColors.spotifyGrey,
                                      )
                                  ),
                                ],
                              ),

                              IconButton(
                                  onPressed: () {
                                    ///Todo: do something
                                  },
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  icon: Icon(
                                    CupertinoIcons.play_arrow_solid,
                                    color: AppColors.spotifyBlack,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Divider(
                        color: AppColors.spotifyGrey.withValues(alpha: .25),
                      ),
                    )
                  ],
                );
              }),
            ),

            ///Leave a space below
            const SizedBox(height: 120.0)
          ],
        ),
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        backgroundColor: const Color(0xEE242424).withValues(alpha: 1),
        constraints: BoxConstraints(
            minWidth: double.infinity
        ),
        builder: (context) {

          String selectedOption = "Recents";

          return StatefulBuilder(builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.bold(
                      text: "Sort by",
                      size: 24.0,
                      color: Colors.white
                  ),

                  const SizedBox(height: 32.0),

                  ...<String>[
                    "Recents",
                    "Recently added",
                    "Alphabetical",
                    "Creator"
                  ].map((option) {

                    final isSelected = selectedOption == option;

                    return ListTile(
                      onTap: () {
                        ///Todo: select this option
                        setModalState(() => selectedOption = option);
                        debugPrint("OPTION: $selectedOption");
                      },
                      contentPadding: EdgeInsets.zero,
                      title: AppTexts.medium(
                          text: option,
                          size: 16.0,
                          color: isSelected ? AppColors.spotifyGreen : Colors.white
                      ),
                      trailing: isSelected ? Icon(
                        Icons.check,
                        color: AppColors.spotifyGreen,
                      ) : SizedBox.shrink(),
                    );
                  }),

                  const SizedBox(height: 20.0),

                  Center(
                    child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: AppTexts.bold(
                            text: "cancel".toUpperCase(),
                            size: 16.0,
                            color: AppColors.spotifyGrey
                        )
                    ),
                  )
                ],
              ),
            );
          });
        }
    );
  }
}
