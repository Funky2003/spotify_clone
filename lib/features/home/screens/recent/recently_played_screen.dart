import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/library/screens/liked_songs/liked_songs_screen.dart';

class RecentlyPlayedScreen extends StatefulWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  State<RecentlyPlayedScreen> createState() => _RecentlyPlayedScreenState();
}

class _RecentlyPlayedScreenState extends State<RecentlyPlayedScreen> {

  final ExpansibleController _expansibleController = ExpansibleController();

  final List<String> _gridBgImages = [
    AppAssets.dummyMjCover,
    AppAssets.dummyArtistImage6,
    AppAssets.dummyArtistProfileImage1,
    AppAssets.dummyPodcastCover
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
        title: AppTexts.bold(
          text: "Recently played",
          size: 20.0,
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Yesterday items
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bold(
                      text: "Yesterday",
                      size: 24.0,
                      color: Colors.white
                    ),

                    const SizedBox(height: 16.0),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.dummyArtistImage6)
                          )
                        ),
                      ),
                      title: AppTexts.medium(
                          text: "Despacito",
                          size: 14.0,
                          color: Colors.white
                      ),
                      subtitle: AppTexts.medium(
                          text: "Song • Luis Fonsi",
                          size: 12.0,
                          color: AppColors.spotifyGrey
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ///Todo: Do something
                        },
                        icon: Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: AppColors.spotifyGrey,
                        )
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    Expansible(
                        headerBuilder: (context, animation) {
                          return ListTile(
                            onTap: () {
                              if (_expansibleController.isExpanded) {
                                _expansibleController.collapse();
                              } else {
                                _expansibleController.expand();
                              }
                            },
                            contentPadding: EdgeInsets.zero,
                            minTileHeight: 60,
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppAssets.dummyArtistImage3),
                            ),
                            title: AppTexts.medium(
                                text: "Taylor Swift",
                                size: 14.0,
                                color: Colors.white
                            ),
                            subtitle: AppTexts.medium(
                                text: "Artist",
                                size: 12.0,
                                color: AppColors.spotifyGrey
                            ),
                          );
                        },
                        bodyBuilder: (context, animation) {
                          return Column(
                            children: List.generate(3, (index) {
                              return ListTile(
                                leading: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage(AppAssets.dummyArtistImage5)
                                     )
                                  ),
                                ),
                                title: AppTexts.medium(
                                    text: "Despacito",
                                    size: 14.0,
                                    color: Colors.white
                                ),
                                subtitle: AppTexts.medium(
                                    text: "Song • Luis Fonsi",
                                    size: 12.0,
                                    color: AppColors.spotifyGrey
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    ///Todo: Do something
                                  },
                                  icon: Icon(
                                    CupertinoIcons.ellipsis_vertical,
                                    color: AppColors.spotifyGrey,
                                  )
                                ),
                              );
                            }),
                          );
                        },
                        controller: _expansibleController
                    ),
                  ],
                ),
              ),

              ///Previous dates
              const SizedBox(height: 32.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bold(
                      text: "Tue, Nov 01, 2022",
                      size: 24.0,
                      color: Colors.white
                    ),

                    const SizedBox(height: 16.0),

                    Column(
                      children: List.generate(3, (index) {

                        final ExpansibleController _podcastExpansibleController = ExpansibleController();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Expansible(
                              headerBuilder: (context, animation) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (_podcastExpansibleController.isExpanded) {
                                        _podcastExpansibleController.collapse();
                                      } else {
                                        _podcastExpansibleController.expand();
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 64,
                                          width: 64,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: AssetImage(AppAssets.dummyPodcastCover)
                                            )
                                          ),
                                        ),

                                        const SizedBox(width: 12.0),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppTexts.medium(
                                              text: "The Design Convo Podcast",
                                              size: 14.0,
                                              color: Colors.white
                                            ),

                                            const SizedBox(height: 8.0),

                                            AppTexts.medium(
                                              text: "Podcast • Shakthi Hari N V",
                                              size: 12.0,
                                              color: AppColors.spotifyGrey
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              bodyBuilder: (context, animation) {
                                return Column(
                                  children: List.generate(2, (index) {
                                    return ListTile(
                                      leading: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(AppAssets.dummyPodcastCover)
                                          )
                                        ),
                                      ),
                                      title: AppTexts.medium(
                                          text: "Sneha Sankar: UX Designer",
                                          size: 14.0,
                                          color: Colors.white
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppTexts.medium(
                                              text: "Episode • 51 mins left",
                                              size: 12.0,
                                              color: AppColors.spotifyGrey
                                          ),

                                          const SizedBox(height: 4.0),

                                          SizedBox(
                                              width: 100,
                                              child: LinearProgressIndicator(
                                                value: .3,
                                                borderRadius: BorderRadius.circular(50),
                                                backgroundColor: const Color(0xEE2A2A2A),
                                                color: AppColors.spotifyGreen,
                                              )
                                          )
                                        ],
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            ///Todo: Do something
                                          },
                                          icon: Icon(
                                            CupertinoIcons.ellipsis_vertical,
                                            color: AppColors.spotifyGrey,
                                          )
                                      ),
                                    );
                                  }),
                                );
                              },
                              controller: _podcastExpansibleController
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),

              /// Previous previous dates
              const SizedBox(height: 16.0),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bold(
                      text: "Fri, Nov 11, 2022",
                      size: 24.0,
                      color: Colors.white
                    ),

                    const SizedBox(height: 16.0),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: () {
                              ///Todo: Navigate to playlist screen
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (route) {
                                  return const LikedSongsScreen();
                                })
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 64,
                                  width: 64,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            const Color(0xEE4202F5).withValues(alpha: .74),
                                            const Color(0xEECA9AF0).withValues(alpha: .50),
                                            const Color(0xEEC0EAC9).withValues(alpha: .74)
                                          ]
                                      )
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppAssets.filledFavoriteIcon,
                                      height: 24,
                                    ),
                                  )
                                ),

                                const SizedBox(width: 12.0),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTexts.medium(
                                        text: "Liked Songs",
                                        size: 14.0,
                                        color: Colors.white
                                    ),

                                    const SizedBox(height: 8.0),

                                    AppTexts.medium(
                                        text: "Playlist",
                                        size: 12.0,
                                        color: AppColors.spotifyGrey
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        Column(
                          children: List.generate(1, (index) {
                            return ListTile(
                              onTap: () {
                                ///Todo: Navigate to artist's profile
                              },
                              leading: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(AppAssets.dummyMjCover)
                                    )
                                ),
                              ),
                              title: AppTexts.medium(
                                  text: "Dangerous",
                                  size: 14.0,
                                  color: Colors.white
                              ),
                              subtitle: AppTexts.medium(
                                  text: "Song • Michael Jackson",
                                  size: 12.0,
                                  color: AppColors.spotifyGrey
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    ///Todo: Do something
                                  },
                                  icon: Icon(
                                    CupertinoIcons.ellipsis_vertical,
                                    color: AppColors.spotifyGrey,
                                  )
                              ),
                            );
                          }),
                        )
                      ]
                    ),

                    const SizedBox(height: 8.0),

                    InkWell(
                      onTap: () {
                        ///Todo:
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                color: Colors.brown
                            ),
                            child: GridView(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(_gridBgImages.length, (index) {
                                return Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(_gridBgImages[index]),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                );
                              }),
                            ),
                          ),

                          const SizedBox(width: 12.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(
                                  text: "#My Playlist 1",
                                  color: Colors.white,
                                  size: 14.0
                              ),

                              const SizedBox(height: 8.0),

                              AppTexts.medium(
                                  text: "Playlist • Ravi",
                                  color: AppColors.spotifyGrey,
                                  size: 12.0
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
