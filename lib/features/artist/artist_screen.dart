import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/artist/artist_detail_screen.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xEE2A2A2A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///User profile
            Stack(
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.dummyArtistImage3),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.spotifyBlack.withValues(alpha: 0),
                          AppColors.spotifyBlack.withValues(alpha: .8)
                        ]
                      )
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.spotifyBlack.withValues(alpha: .25)
                              ),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white
                              )
                          ),

                          AppTexts.black(
                              text: "Michael Jackson",
                              size: 48,
                              color: Colors.white,
                              height: 1
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            ///Monthly listeners
            Container(
              height: 102,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xEE121212),
                    const Color(0xEE000000)
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppTexts.medium(
                    text: "34,694,882 monthly listeners",///Todo: Replace with count from backend
                    size: 12.0,
                    color: AppColors.spotifyGrey
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                ///Todo: Follow artist
                              },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 1.5
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  )
                              ),
                              child: AppTexts.medium(
                                  text: "Follow",
                                  size: 12.0,
                                  color: Colors.white
                              )
                          ),
                          IntrinsicWidth(
                            child: Row(
                              children: [
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
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 56,
                        width: 56,
                        child: Stack(
                          children: [
                            Center(
                              child: IconButton(
                                onPressed: () {
                                  ///Todo: Play album
                                },
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(16),
                                  backgroundColor: AppColors.spotifyGreen
                                ),
                                icon: Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color: AppColors.spotifyBlack,
                                )
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColors.spotifyBlack1,
                                child: Icon(
                                  Icons.shuffle,
                                  size: 10.0,
                                  color: AppColors.spotifyGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            ///Popular songs/hits
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AppTexts.bold(
                      text: "Popular",
                      size: 16.0,
                      color: Colors.white
                    ),
                  ),

                  //Tracks
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(4, (index) {
                        return InkWell(
                          onTap: () {
                            ///Todo: Play this song
                          },
                          child: Row(
                            children: [
                              AppTexts.regular(
                                  text: '${++index}',
                                  size: 14.0,
                                  color: Colors.white
                              ),

                              const SizedBox(width: 16.0),

                              Expanded(
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(AppAssets.dummyMjCover)
                                        )
                                    ),
                                  ),
                                  title: AppTexts.medium(
                                      text: "Thriller",
                                      size: 14.0,
                                      color: Colors.white
                                  ),
                                  subtitle: AppTexts.medium(
                                      text: "1,285,913,284",
                                      size: 10.0,
                                      color: AppColors.spotifyGrey
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        ///Todo: show something
                                      },
                                      icon: Icon(
                                        CupertinoIcons.ellipsis_vertical,
                                        color: AppColors.spotifyGrey,
                                      )
                                  ),
                                ),
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

            ///Artist's pick
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AppTexts.bold(
                      text: "Artist Pick",
                      size: 16.0,
                      color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Container(
                    height: 256,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.dummyArtistImage9),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.spotifyBlack.withValues(alpha: .7)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 28.0,
                            padding: const EdgeInsets.only(left: 2, right: 10, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyArtistImage3)
                                    )
                                  ),
                                ),

                                const SizedBox(width: 8.0),

                                AppTexts.medium(
                                  text: "The Best of Michael Jackson",
                                  size: 10.0,
                                  color: AppColors.spotifyBlack
                                )
                              ],
                            ),
                          ),

                          ListTile(
                            onTap: () {
                              ///Todo: Do something
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyMjCover)
                                  )
                              ),
                            ),
                            title: AppTexts.medium(
                                text: "Thriller",
                                size: 14.0,
                                color: Colors.white
                            ),
                            subtitle: AppTexts.medium(
                                text: "1,285,913,284",
                                size: 10.0,
                                color: AppColors.spotifyGrey
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Popular releases
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AppTexts.bold(
                      text: "Popular releases",
                      size: 16.0,
                      color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  //Albums
                  Column(
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () {
                            ///Todo: Do something
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyCoverImage7)
                                  )
                                ),
                              ),

                              const SizedBox(width: 12.0),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTexts.medium(
                                    text: "XSCAPE",
                                    size: 14.0,
                                    color: Colors.white
                                  ),

                                  const SizedBox(height: 4.0),

                                  AppTexts.medium(
                                    text: "2014 • Album",
                                    size: 12.0,
                                    color: AppColors.spotifyGrey
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 8.0),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        ///Todo: See discography
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.spotifyGrey
                        )
                      ),
                      child: AppTexts.medium(
                        text: "See discography"
                      )
                    ),
                  )
                ],
              ),
            ),

            ///Features
            const SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: AppTexts.bold(
                    text: "Featuring ${"Michael Jackson"}",///Todo: Replace with artist name from backend
                    size: 16.0,
                    color: Colors.white
                  ),
                ),

                const SizedBox(height: 10.0),

                //Features
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(12, (index) {
                      return Container(
                        width: 130,
                        margin: const EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          // color: Colors.yellow
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.dummyCoverImage6)
                                )
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            Center(
                              child: AppTexts.bold(
                                text: "This is Michael Jackson",
                                size: 14.0,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                align: TextAlign.center
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),

            ///Merch
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AppTexts.bold(
                      text: "Merch",
                      size: 16.0,
                      color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Column(
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () {
                            ///Todo: Do something
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyCoverImage5)
                                  )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CupertinoColors.systemRed
                                      ),
                                      padding: const EdgeInsets.all(2.0),
                                      child: AppTexts.black(
                                        text: "ON SALE",
                                        size: 12.0,
                                        color: Colors.white
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              const SizedBox(width: 12.0),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTexts.medium(
                                      text: "Thriller 40 Record",
                                      size: 14.0,
                                      color: Colors.white
                                    ),

                                    const SizedBox(height: 4.0),

                                    AppTexts.medium(
                                      text: "Each record is protected within its record something again",
                                      size: 12.0,
                                      color: AppColors.spotifyGrey,
                                      overflow: TextOverflow.ellipsis
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
                ],
              ),
            ),

            ///About
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    child: AppTexts.bold(
                      text: "About",
                      size: 16.0,
                      color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (route) {
                        return const ArtistDetailScreen();
                      })
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        // color: Colors.green
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: double.infinity,
                              height: 390,
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.dummyArtistImage2),
                                  fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(AppAssets.verifiedBadge),
                                        color: const Color(0xEE2E77D0),
                                      ),

                                      const SizedBox(width: 6.0),

                                      AppTexts.medium(
                                        text: "VERIFIED ARTIST",
                                        size: 10.0,
                                        color: AppColors.spotifyGrey
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 110,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            AppTexts.black(
                                              text: "3,47,80,242", ///Todo: From backend
                                              size: 14.0,
                                              color: Colors.white
                                            ),

                                            const SizedBox(width: 6.0),

                                            AppTexts.medium(
                                              text: "MONTHLY LISTENERS",
                                              size: 10.0,
                                              color: AppColors.spotifyGrey
                                            )
                                          ],
                                        ),

                                        const SizedBox(height: 6.0),

                                        Row(
                                          children: [
                                            Expanded(
                                              ///Todo: Bio from backend
                                              child: AppTexts.medium(
                                                text: "Michael Jackson wasn’t merely the biggest pop start of his era, shaping the sound and style of the 1970s and ‘80s; he was one of the best.",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppTexts.bold(
                                        text: '${12}', ///Todo: Get from backend
                                        size: 16.0,
                                        color: AppColors.spotifyBlack
                                      ),
                                      AppTexts.regular(
                                        text: 'rd',
                                        size: 10.0,
                                        color: AppColors.spotifyBlack
                                      ),
                                    ],
                                  ),

                                  AppTexts.regular(
                                    text: 'in the world',
                                    size: 10.0,
                                    color: AppColors.spotifyBlack
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Artist playlist
            const SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: AppTexts.bold(
                    text: "Artist playlist",
                    size: 16.0,
                    color: Colors.white
                  ),
                ),

                const SizedBox(height: 10.0),

                //Playlists
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(12, (index) {
                      return Container(
                        width: 130,
                        margin: const EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          // color: Colors.yellow
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(AppAssets.dummyCoverImage2)
                                  )
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            Center(
                              child: AppTexts.bold(
                                text: "The MJCast - A Michael Jackson",
                                size: 14.0,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                align: TextAlign.center
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),

            ///Fans listens
            const SizedBox(height: 48.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: AppTexts.bold(
                    text: "Fans also like",
                    size: 16.0,
                    color: Colors.white
                  ),
                ),

                const SizedBox(height: 10.0),

                //Playlists
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(12, (index) {
                      return Container(
                        width: 130,
                        margin: const EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          // color: Colors.yellow
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.dummyArtistProfileImage1)
                                )
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            Center(
                              child: AppTexts.bold(
                                text: "The Weekend",
                                size: 14.0,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                align: TextAlign.center
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),



            ///Leave a space at the bottom
            const SizedBox(height: 120.0)
          ],
        ),
      ),
    );
  }
}
