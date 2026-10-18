import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class BlendScreen extends StatefulWidget {
  const BlendScreen({super.key});

  @override
  State<BlendScreen> createState() => _BlendScreenState();
}

class _BlendScreenState extends State<BlendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          color: AppColors.spotifyBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.white,
              ),

              AppTexts.bold(
                text: "Create a Blend",
                size: 16.0,
                color: Colors.white
              ),

              IconButton(onPressed: null, icon: SizedBox.shrink())
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),

            Center(
              child: SizedBox(
                width: 216,
                height: 128,
                child: Stack(
                  children: [

                    Align(
                      alignment: .centerRight,
                      child: Container(
                        height: 128,
                        width: 128,
                        decoration: BoxDecoration(
                          color: AppColors.spotifyGrey,
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                            size: 46,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.dummyCoverImage3)
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: AppColors.spotifyBlack
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              margin: const .symmetric(vertical: 28.0),
              padding: const .symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  AppTexts.bold(
                    text: "Invite friends to Blend",
                    size: 24.0,
                    color: Colors.white
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.medium(
                      text: "Invite up to 10 friends to a Blend, a shared playlist that gives you social recommendations based on all of your music tastes.",
                      size: 12.0,
                      color: Colors.white,
                      align: TextAlign.center
                    ),
                  ),

                  AppTexts.medium(
                    text: "Note: People in this Blend will be able to add their friends. We may also create other playlists that include social recommendations. People in social recommendations playlists will be able to see your profile picture and username. Learn more about these playlists and information they include.",
                    size: 10.0,
                    color: AppColors.spotifyGrey,
                    align: TextAlign.center
                  )
                ],
              ),
            ),

            Center(
              child: FilledButton(
                onPressed: () {
                  ///Todo:
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const .symmetric(horizontal: 32)
                ),
                child: AppTexts.bold(
                  text: "Invite",
                  size: 14.0,
                  color: AppColors.spotifyBlack
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
