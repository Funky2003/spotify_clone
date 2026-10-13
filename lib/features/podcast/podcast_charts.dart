import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/podcast/podcast_country_option_detail.dart';
import 'package:spotify_clone/features/podcast/podcast_country_options.dart';

class PodcastCharts extends StatefulWidget {
  const PodcastCharts({super.key});

  @override
  State<PodcastCharts> createState() => _PodcastChartsState();
}

class _PodcastChartsState extends State<PodcastCharts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE10192F).withValues(alpha: 1),
        leading: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xEE19243E).withValues(alpha: 1),
                AppColors.spotifyBlack.withValues(alpha: 1)
              ]
            )
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.medium(
                text: "India",///Todo: From backend
                size: 12.0,
                color: Colors.white
              ),

              AppTexts.medium(
                text: "Podcast charts",///Todo: From backend
                size: 26.0,
                color: Colors.white
              ),

              const SizedBox(height: 16.0),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: List.generate(2, (index) {

                    final bgColor = Color.fromARGB(
                      Random().nextInt(255),
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                    );

                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (route) => const PodcastCountryOptionDetail())),
                      child: Container(
                        width: 165,
                        margin: EdgeInsets.only(right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 165,
                              width: double.infinity,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ImageIcon(
                                          AssetImage(AppAssets.appIcon),
                                          size: 14.0,
                                        ),

                                        const SizedBox(height: 8.0),

                                        AppTexts.bold(
                                          text: "Top Podcasts",///Todo: from backend
                                          size: 24.0,
                                        )
                                      ],
                                    ),
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(9)
                                          )
                                        ),
                                        child: Center(
                                          child: Transform.rotate(
                                            angle: -150,
                                            child: Icon(
                                              Icons.arrow_upward_outlined,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8.0),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppTexts.black(
                                            text: "Top charts", ///Todo: from backend
                                            size: 12.0,
                                            color: Colors.white
                                          ),

                                          AppTexts.black(
                                            text: "India",///Todo: from backend
                                            size: 10.0,
                                            color: Colors.white
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            AppTexts.medium(
                              text: "Top Podcasts India",///Todo: from backend
                              size: 12,
                              color: Colors.white
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 16.0),

              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (route) => const PodcastCountryOptions())),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  CupertinoIcons.flag,
                  color: Colors.white,
                  size: 32,
                ),
                title: AppTexts.medium(
                  text: "Podcast charts by country",
                  size: 14,
                  color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
