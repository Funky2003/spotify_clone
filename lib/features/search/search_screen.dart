import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/podcast/podcast_session_screen.dart';
import 'package:spotify_clone/features/releases/new_releases.dart';
import 'package:spotify_clone/features/search/screens/search_active_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final List<String> spotifyPodcastCategories = [
    'Arts',
    'Business',
    'Comedy',
    'New Releases',
    'Fiction',
    'Government',
    'Health & Fitness',
    'History',
    'Kids & Family',
    'Leisure',
    'Music',
    'News',
    'Religion & Spirituality',
    'Science',
    'Society & Culture',
    'Sports',
    'Technology',
    'True Crime',
    'TV & Film',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
              child: Center(
                child: Row(
                  children: [
                    AppTexts.bold(
                      text: "Search",
                      size: 24.0,
                      color: Colors.white,
                      align: TextAlign.start
                    ),
                  ],
                ),
              ),
            ),

            ///Searchbar
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: SearchBar(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (route) {
                    return const SearchActiveScreen();
                  })
                ),
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                leading: Icon(
                  CupertinoIcons.search,
                  color: AppColors.spotifyBlack
                ),
                hintText: "What do you want to listen to?",
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)
                  )
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Label
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: AppTexts.bold(
                        text: "Browse all",
                        size: 16.0,
                        color: Colors.white
                      ),
                    ),

                    ///Cards
                    Padding(
                      padding: const EdgeInsets.all(16.0),
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

                            final isNewReleases = spotifyPodcastCategories[3] == category;

                            return GestureDetector(
                              onTap: () {
                                HapticFeedback.vibrate();

                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (route) {

                                    if (isNewReleases) return NewReleasesScreen();

                                    return PodcastSessionScreen(title: category);
                                  })
                                );
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
                                                  image: AssetImage(AppAssets.searchCover)
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

                    ///Leave a space at the bottom
                    const SizedBox(height: 240.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
