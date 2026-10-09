import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/podcast/podcast_charts.dart';
import 'package:spotify_clone/features/podcast/podcast_details.dart';

class PodcastSessionScreen extends StatefulWidget {

  final String title;

  const PodcastSessionScreen({super.key, required this.title});

  @override
  State<PodcastSessionScreen> createState() => _PodcastSessionScreenState();
}

class _PodcastSessionScreenState extends State<PodcastSessionScreen> {

  final List<String> spotifyPodcastCategories = [
    'Comedy',
    'Podcast Charts',
    'True Crime',
    'News',
    'Sports',
    'Health & Fitness',
    'Business',
    'Education',
    'History',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          color: Color(0xEE282828),
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

              AppTexts.bold(
                  text: widget.title,
                  size: 16.0,
                  color: Colors.white
              ),

              IconButton(
                onPressed: ()  {
                  ///Todo: Share podcast
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Episode of the week
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.bold(
                      text: "Best episodes of the week",
                      size: 18.0,
                      color: Colors.white
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(7, (index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (route) {
                              return PodcastDetails(albumCoverRef: AppAssets.dummyPodcastCover2);
                            })
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 16.0),
                            width: 125,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 125,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AppAssets.dummyPodcastCover2)
                                      )
                                  ),
                                ),

                                const SizedBox(height: 8.0),

                                AppTexts.bold(
                                  text: "How much should we depend on our Nuclear power plants?",
                                  size: 12.0,
                                  color: Colors.white,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                AppTexts.medium(
                                    text: "Maha Bharat with Dhruv Rathee",
                                    size: 10.0,
                                    color: AppColors.spotifyGrey,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis
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

            ///Top something podcast
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.bold(
                      text: "Top Tamil Podcasts",
                      size: 18.0,
                      color: Colors.white
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(7, (index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 16.0),
                          width: 125,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyPodcastCover3)
                                  )
                                ),
                              ),

                              const SizedBox(height: 8.0),

                              AppTexts.bold(
                                text: "Adhe Kuralgal with Deepa Venkat (A Tamil Thriller Podcast)",
                                size: 12.0,
                                color: Colors.white,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              AppTexts.medium(
                                text: "Spotify Studios",
                                size: 10.0,
                                color: AppColors.spotifyGrey,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
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

            ///Categories
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.bold(
                      text: "Categories",
                      size: 18.0,
                      color: Colors.white
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 2
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ...spotifyPodcastCategories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                HapticFeedback.vibrate();

                                final isCharts = spotifyPodcastCategories[1] == category;

                                if (isCharts) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (route) {
                                      return PodcastCharts();
                                    })
                                  );
                                }
                              },
                              child: Container(
                                width: 120.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                    255,
                                    Random().nextInt(256),
                                    Random().nextInt(256),
                                    Random().nextInt(256)
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -6,
                                      right: -12,
                                      child: Transform.rotate(
                                        angle: -20,
                                        child: Container(
                                          height: 74,
                                          width: 74,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(AppAssets.dummyArtImage)
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black.withValues(alpha: .5),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 4
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: AppTexts.bold(
                                            text: category, ///Todo: From backend
                                            size: 14.0,
                                            color: Colors.white
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                        ]
                    ),
                  ),
                ],
              ),
            ),


            TextButton(
              onPressed: () {
                ///Todo: See all categories
              },
              style: TextButton.styleFrom(
                side: BorderSide(
                  color: const Color(0xEE2A2A2A)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24.0)
              ),
              child: AppTexts.bold(
                text: "See all categories",
                size: 10.0,
                color: AppColors.spotifyGrey
              ),
            ),


            ///Leave a space below
            const SizedBox(height: 120.0,)
          ],
        ),
      ),
    );
  }
}
