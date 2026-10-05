import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/features/artist/artist_screen.dart';

import '../../core/app_colors.dart';
import '../../core/app_texts.dart';
import '../home/screens/notification/notification.dart';

class AlbumSongsScreen extends StatefulWidget {
  const AlbumSongsScreen({super.key});

  @override
  State<AlbumSongsScreen> createState() => _AlbumSongsScreenState();
}

class _AlbumSongsScreenState extends State<AlbumSongsScreen> {


  bool _hasLikedAlbum = true;

  final List<String> dangerousAlbumTracks = [
    "Jam",
    "Why You Wanna Trip on Me",
    "In the Closet",
    "She Drives Me Wild",
    "Remember the Time",
    "Can't Let Her Get Away",
    "Heal the World",
    "Black or White",
    "Who Is It",
    "Give In to Me",
    "Will You Be There",
    "Keep the Faith",
    "Gone Too Soon",
    "Dangerous"
  ];

  Map<String, String> michaelJacksonAlbums = {
    'Got to Be There': AppAssets.dummyArtistImage6,
    'Ben': AppAssets.dummyPodcastCover,
    'Music & Me': AppAssets.dummyCoverImage7,
    'Forever, Michael': AppAssets.dummyArtistImage5,
    'Off the Wall': AppAssets.dummyCoverImage3,
    'Thriller': AppAssets.dummyArtistImage2,
    'Bad': AppAssets.dummyArtistImage9,
    'HIStory: Past, Present and Future, Book I': AppAssets.dummyArtistProfileImage1,
    'Invincible': AppAssets.dummyShowsImage1
  };

  final List<BottomSheetItemModel> _bottomSheetItems = [
    BottomSheetItemModel(icon: CupertinoIcons.music_note_2, label: "Add to playlist"),
    BottomSheetItemModel(icon: Icons.download_for_offline_outlined, label: "Download"),
    BottomSheetItemModel(icon: Icons.check, label: "Mark as played"),
    BottomSheetItemModel(icon: Icons.share, label: "Share"),
    BottomSheetItemModel(icon: Icons.mic, label: "Go to podcast"),
    BottomSheetItemModel(icon: CupertinoIcons.plus, label: "Follow")
  ];

  void get _navigateToArtisScreen => Navigator.of(context).push(
    MaterialPageRoute(builder: (route) => const ArtistScreen())
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE414549).withValues(alpha: .4),
        leadingWidth: double.infinity,
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xEE43484B).withValues(alpha: 1)
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )
              ),

              const SizedBox(width: 16.0),

              AppTexts.bold(
                text: "Dangerous",///Todo: Replace with album name from model
                size: 20.0,
                color: Colors.white
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Album cover and details
            Container(
              padding: const EdgeInsets.only(bottom: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xEE43484B).withValues(alpha: 1),
                    const Color(0xEE121212).withValues(alpha: 0),
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 223,
                      width: 223,
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.dummyMjCover),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bold(
                          text: "Dangerous",///Todo: Replace with album name from backend
                          size: 20.0,
                          color: Colors.white
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: InkWell(
                            onTap: () =>_navigateToArtisScreen,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(AppAssets.dummyArtistImage6),
                                ),

                                const SizedBox(width: 8.0),

                                AppTexts.bold(
                                  text: "Michael Jackson", ///Todo:
                                  size: 12.0,
                                  color: Colors.white
                                )
                              ],
                            ),
                          ),
                        ),

                        AppTexts.medium(
                          text: "Album • 1991", ///Todo:
                          size: 12.0,
                          color: AppColors.spotifyGrey
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ///Todo:
                                setState(() => _hasLikedAlbum = !_hasLikedAlbum);
                              },
                              icon: ImageIcon(
                                AssetImage(
                                    _hasLikedAlbum
                                        ? AppAssets.filledFavoriteIcon
                                        : AppAssets.outlineFavoriteIcon
                                ),
                                color: _hasLikedAlbum
                                    ? AppColors.spotifyGreen
                                    : Colors.white
                              )
                            ),

                            IconButton(
                              onPressed: () => _showMusicCardBottomSheet(),
                              icon: Icon(
                                CupertinoIcons.ellipsis_vertical,
                                color: AppColors.spotifyGrey
                              )
                            )
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
                    ),
                  )
                ],
              ),
            ),

            ///Songs
            ...dangerousAlbumTracks.map((track) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  onTap: () {
                    ///Todo: Play this song
                  },
                  title: AppTexts.medium(
                      text: track,
                      size: 14.0,
                      color: Colors.white
                  ),
                  subtitle: AppTexts.medium(
                      text: "Michale Jackson",
                      size: 10.0,
                      color: AppColors.spotifyGrey
                  ),
                  trailing: InkWell(
                      onTap: () {
                        ///Todo:
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        color: AppColors.spotifyGrey,
                      )
                  ),
                ),
              );
            }),

            ///Album metadata
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.medium(
                    text: "November 13, 1991",
                    size: 14.0,
                    color: Colors.white
                  ),
                  AppTexts.medium(
                    text: "14 songs • 1 hr 16 min",
                    size: 14.0,
                    color: Colors.white
                  ),

                  const SizedBox(height: 16.0),

                  InkWell(
                    onTap: () => _navigateToArtisScreen,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(AppAssets.dummyArtistImage6),
                        ),

                        const SizedBox(width: 8.0),

                        AppTexts.bold(
                          text: "Michael Jackson", ///Todo:
                          size: 12.0,
                          color: Colors.white
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///You might also like
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.bold(
                    text: "You might also like",
                    size: 14.0,
                    color: Colors.white
                  ),
                  
                  const SizedBox(height: 20),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...michaelJacksonAlbums.entries.map((album) {
                          return Container(
                            width: 114,
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 114,
                                  width: 114,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(album.value),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: album.key,
                                  size: 12.0,
                                  color: Colors.white,
                                  align: TextAlign.center
                                )
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 32),
              child: AppTexts.medium(
                text: "℗ 1991 MJJ Productions Inc.", ///Todo:
                size: 14.0,
                color: AppColors.spotifyGrey
              ),
            ),


            ///Leave a space at the bottom
            const SizedBox(height: 120)
          ],
        ),
      ),
    );
  }

  void _showMusicCardBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.black,
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
                                  image: AssetImage(AppAssets.dummyMjCover),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xEEF4AC45)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ImageIcon(
                                    AssetImage(AppAssets.appIcon),
                                    color: Colors.black
                                  ),
                                ),

                                Expanded(
                                  child: ImageIcon(
                                    AssetImage(AppAssets.musicBars),
                                    color: Colors.black
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
                            text: "Dangerous",///Todo:
                            size: 16.0,
                            color: Colors.white
                        ),

                        AppTexts.regular(
                            text: "Michael Jackson",///Todo:
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
