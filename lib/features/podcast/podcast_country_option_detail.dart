import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class PodcastCountryOptionDetail extends StatefulWidget {
  const PodcastCountryOptionDetail({super.key});

  @override
  State<PodcastCountryOptionDetail> createState() => _PodcastCountryOptionDetailState();
}

class _PodcastCountryOptionDetailState extends State<PodcastCountryOptionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE0C1144).withValues(alpha: 1),
        leading: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xEE000D80).withValues(alpha: 1),
                const Color(0xEE000D80).withValues(alpha: .9),
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xEE000D80).withValues(alpha: .95),
                        Color(0xEE121212).withValues(alpha: 0)
                      ]
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: const Color(0xEE2D46B9),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageIcon(
                                    AssetImage(AppAssets.appIcon),
                                    size: 8,
                                    color: Colors.white,
                                  ),

                                  const SizedBox(height: 8.0),

                                  AppTexts.bold(
                                      text: "Top Podcasts",
                                      size: 14.0,
                                      color: Colors.white
                                  )
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                Container(
                                  height: 18.0,
                                  width: 18.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4)
                                    ),
                                  ),
                                  child: Center(
                                    child: Transform.rotate(
                                      angle: -150,
                                      child: Icon(
                                        Icons.arrow_upward_outlined,
                                        color: const Color(0xEE2D46B9),
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 5.0),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTexts.black(
                                        text: "Podcast Charts",
                                        size: 6.5,
                                        color: Colors.white
                                    ),
                                    AppTexts.black(
                                        text: "India", ///Todo:  from backend
                                        size: 5.45,
                                        color: Colors.white
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(width: 12.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.medium(
                              text: "India",///Todo: from backend
                              size: 10,
                              color: Colors.white
                          ),

                          AppTexts.black(
                              text: "Top Podcasts",
                              size: 34.0,
                              color: Colors.white
                          )
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 12.0),

                  AppTexts.medium(
                      text: "The most popular podcasts, updated daily.",
                      size: 10.0,
                      color: AppColors.spotifyGrey
                  )
                ],
              ),
            ),

            ///Popular podcasts
            Container(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: List.generate(23, (index) {

                  final isUp = (index%2) == 0;

                  final isOkay = (index%3) != 0;

                  return ListTile(
                    onTap: () {
                      ///Todo: Navigate to podcast details
                    },
                    leading: IntrinsicWidth(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTexts.medium(
                                text: '${++index}',
                                size: 14.0,
                                color: AppColors.spotifyGrey
                              ),

                              if (isOkay) ...[
                                SizedBox(
                                  width: 24,
                                )
                              ]
                              else ...[
                                if (isUp) ...[
                                  Icon(
                                    Icons.arrow_drop_up,
                                    color: const Color(0xEE00FF00),
                                  )
                                ]
                                else ...[
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: const Color(0xEEFF0000),
                                  )
                                ]
                              ]

                            ],
                          ),

                          const SizedBox(width: 12.0),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(
                              image: AssetImage(AppAssets.dummyCoverImage1),///Todo: from backend
                            ),
                          )
                        ],
                      ),
                    ),
                    title: AppTexts.medium(
                        text: "The Ranveer Show",///Todo: from backend
                        size: 14.0,
                        color: Colors.white
                    ),
                    subtitle: AppTexts.medium(
                        text: "BeerBiceps", ///Todo: from backend
                        size: 10.0,
                        color: AppColors.spotifyGrey
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      )
    );
  }
}
