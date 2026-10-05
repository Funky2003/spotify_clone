import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';

import '../../core/app_colors.dart';
import '../../core/app_texts.dart';

class ArtistDetailScreen extends StatelessWidget {
  const ArtistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          decoration: BoxDecoration(
              color: AppColors.spotifyBlack1
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
              AppTexts.bold(
                  text: "Michael Jackson", ///Todo: From backend
                  size: 20.0,
                  color: Colors.white
              ),

              IconButton(
                  onPressed: null,
                  icon: Icon(null)
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Leave a space above
            const SizedBox(height: 24.0),

            ///Images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 311,
                    width: 311,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppAssets.dummyArtistImage3
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  );
                }),
              ),
            ),

            ///Bio
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.black(
                            text: "3,47,80,242", ///Todo: From backend
                            size: 34.0,
                            color: Colors.white
                          ),

                          AppTexts.medium(
                            text: "MONTHLY LISTENERS",
                            size: 10.0,
                            color: AppColors.spotifyGrey
                          )
                        ],
                      ),

                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xEE2E77D0),
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${83}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                  )
                                ),

                                TextSpan(
                                  text: "rd\nin the world"
                                )
                              ]
                            )
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 24.0),

                  AppTexts.medium(
                    text: "Michael Jackson wasn’t merely the biggest pop start of his era, shaping the sound and style of the 1970s and ‘80s",
                  )
                ],
              ),
            ),

            ///Socials
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      ///Go to social
                    },
                    leading: ImageIcon(
                      AssetImage(
                        AppAssets.instagramIcon
                      ),
                      color: Colors.white,
                    ),
                    title: AppTexts.medium(
                      text: "Instagram",
                      size: 12.0
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      ///Go to social
                    },
                    leading: ImageIcon(
                      AssetImage(
                        AppAssets.twitterIcon
                      ),
                      color: Colors.white,
                    ),
                    title: AppTexts.medium(
                      text: "Twitter",
                      size: 12.0
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
