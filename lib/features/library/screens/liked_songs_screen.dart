import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';

import '../../../core/app_texts.dart';

class LikedSongsScreen extends StatefulWidget {
  const LikedSongsScreen({super.key});

  @override
  State<LikedSongsScreen> createState() => _LikedSongsScreenState();
}

class _LikedSongsScreenState extends State<LikedSongsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE07183A),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xEE001D55).withValues(alpha: .55),
                        AppColors.spotifyBlack.withValues(alpha: 0)
                      ]
                  )
              ),
              child: Column(
                children: [
                  ///Search bar/Sort
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SearchBar(
                            elevation: WidgetStatePropertyAll(0),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                                Colors.white.withValues(alpha: .1)
                            ),
                            leading: Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                              size: 16.0,
                            ),
                            hintText: "Find in liked songs",
                            hintStyle: WidgetStatePropertyAll(
                                TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ),

                        const SizedBox(width: 8.0),

                        TextButton(
                          onPressed: () {
                            ///Todo: Sort items
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
                                        })
                                      ],
                                    ),
                                  );
                                });
                              }
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white.withValues(alpha: .1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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

                  ///Liked songs title
                  Padding(
                    padding: const EdgeInsets.only(top: 64.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bold(
                            text: "Like Songs",
                            size: 24.0,
                            color: Colors.white
                        ),

                        const SizedBox(height: 12.0),

                        AppTexts.medium(
                            text: "${12} songs",
                            size: 12.0,
                            color: AppColors.spotifyGrey
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                ///Todo: Play songs from start
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                    color: AppColors.spotifyGreen,
                                    shape: BoxShape.circle
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Icon(CupertinoIcons.play_arrow_solid),
                                    ),

                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: AppColors.spotifyBlack1,
                                        child: Icon(
                                          CupertinoIcons.shuffle_medium,
                                          size: 10,
                                          color: AppColors.spotifyGreen,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Songs
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0),
              child: Column(
                children: List.generate(35, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAssets.dummyMjCover),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      title: AppTexts.medium(
                          text: "Remember the Time",
                          size: 14.0,
                          color: index == 0 ? AppColors.spotifyGreen : AppColors.spotifyGrey
                      ),
                      subtitle: Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(
                                    text: "Lyrics",
                                    style: TextStyle(
                                        color: AppColors.spotifyBlack,
                                        backgroundColor: AppColors.spotifyGrey,
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                TextSpan(
                                    text: "  Michael Jackson",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                        color: AppColors.spotifyGrey
                                    )
                                )
                              ]
                          )
                      ),
                      trailing: IntrinsicWidth(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  ///Todo: Like song
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.filledFavoriteIcon),
                                  color: AppColors.spotifyGreen,
                                )
                            ),

                            IconButton(
                                onPressed: () {
                                  ///Todo: Like song
                                },
                                icon: Icon(
                                  CupertinoIcons.ellipsis_vertical,
                                  color: AppColors.spotifyGrey,
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
