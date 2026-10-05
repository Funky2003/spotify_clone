import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/features/artist/artist_screen.dart';

import '../../core/app_colors.dart';
import '../../core/app_texts.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xEE494E52).withValues(alpha: .9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Playlist details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xEE494E52).withValues(alpha: .9),
                    const Color(0xEE121212).withValues(alpha: 0)
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
                            hintText: "Find in playlist",
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

                  ///Playlist cover
                  Container(
                    height: 255,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      // color: CupertinoColors.activeGreen
                    ),
                    child: Center(
                      child: Container(
                        height: 233,
                        width: 233,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.dummyArtImage)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .5),
                              offset: Offset(10, 10),
                              blurRadius: 76
                            )
                          ]
                        ),
                      ),
                    ),
                  ),

                  ///Playlist details
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bold(
                          text: "#My Playlist 1", ///Todo: From backend
                          size: 20.0,
                          color: Colors.white
                        ),

                        const SizedBox(height: 12.0),

                        AppTexts.medium(
                          text: "All time Hits",
                          size: 12.0,
                          color: AppColors.spotifyGrey
                        ),

                        ListTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (route) {
                              return const ArtistScreen();
                            })
                          ),
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 12.0,
                            backgroundImage: AssetImage(AppAssets.dummyArtistProfileImage1),
                          ),
                          title: AppTexts.bold(
                            text: "Ravi", ///Todo: From backend
                            size: 12.0
                          ),
                          horizontalTitleGap: 8.0,
                        ),

                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.globe,
                              color: AppColors.spotifyGrey,
                            ),

                            const SizedBox(width: 8.0),

                            AppTexts.medium(
                              text: "01hr 24min", ///Todo: From backend
                              size: 12.0,
                              color: AppColors.spotifyGrey
                            )
                          ],
                        ),

                        const SizedBox(height: 12.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ///Todo: Enhance
                                  },
                                  style: TextButton.styleFrom(
                                    side: BorderSide(
                                      color: AppColors.spotifyGrey
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 24.0)
                                  ),
                                  child: AppTexts.medium(
                                    text: "Enhance",
                                    size: 12.0,
                                    color: Colors.white
                                  )
                                ),

                                IconButton(
                                  onPressed: () {
                                    ///Todo: Add song
                                  },
                                  icon: Icon(
                                    Icons.person_add_outlined,
                                    color: AppColors.spotifyGrey,
                                  )
                                ),

                                IconButton(
                                  onPressed: () {
                                    ///Todo: Add song
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
                                ///Todo: Play album
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.spotifyGreen
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color: AppColors.spotifyBlack,
                                  size: 32.0,
                                ),
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          ///Todo: Enhance
                        },
                        style: TextButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.spotifyGrey
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24.0)
                        ),
                        child: AppTexts.medium(
                          text: "Add songs",
                          size: 10.0,
                          color: Colors.white
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Songs in playlist
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: List.generate(7, (index) {
                  return ListTile(
                    onTap: () {
                      ///Todo: Play song
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(AppAssets.dummyArtistProfileImage1), ///Todo: From backend,
                    title: AppTexts.medium(
                      text: "Remember the Time",
                      size: 14.0,
                      color: Colors.white
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
                      child: IconButton(
                          onPressed: () {
                            ///Todo: Like song
                          },
                          icon: Icon(
                            CupertinoIcons.ellipsis_vertical,
                            color: AppColors.spotifyGrey,
                          )
                      ),
                    ),
                  );
                }),
              ),
            ),

            ///Recommended songs
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: AppTexts.bold(
                        text: "Recommended songs",
                        size: 16.0,
                        color: Colors.white
                    ),
                    subtitle: AppTexts.medium(
                        text: "Based on the songs in this playlist",
                        size: 10.0,
                        color: AppColors.spotifyGrey
                    ),
                  ),

                  Column(
                    children: List.generate(4, (index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        leading: Image.asset(AppAssets.dummyCoverImage7), ///Todo: From backend
                        title: AppTexts.medium(
                          text: "Happier Than Ever",///Todo: From backend
                          size: 14.0,
                          color: Colors.white
                        ),
                        subtitle: AppTexts.medium(
                            text: "Billie Eilish", ///Todo: From backend
                            size: 10.0,
                            color: AppColors.spotifyGrey
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            ///Todo: add music
                          },
                          icon: ImageIcon(
                            AssetImage(AppAssets.addMusicIcon),
                            color: AppColors.spotifyGrey,
                          ),
                        ),
                      );
                    }),
                  )
                ],
              )
            ),

            const SizedBox(height: 24),
            Center(
              child: FilledButton(
                onPressed: () {
                  ///Todo: Refresh
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white
                ),
                child: AppTexts.bold(
                  text: "Refresh",
                  size: 12.0,
                  color: AppColors.spotifyBlack
                )
              ),
            ),






            ///Leave a at bottom
            const SizedBox(height: 120.0)
          ],
        ),
      ),
    );
  }
}
