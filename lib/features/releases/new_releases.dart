import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class NewReleasesScreen extends StatefulWidget {
  const NewReleasesScreen({super.key});

  @override
  State<NewReleasesScreen> createState() => _NewReleasesScreenState();
}

class _NewReleasesScreenState extends State<NewReleasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xEEC63A2A).withValues(alpha: 1)
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
              height: 64,
              padding: const EdgeInsets.only(left: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xEEC63A2A).withValues(alpha: 1),
                    AppColors.spotifyBlack.withValues(alpha: .7)
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTexts.black(
                    text: "New Releases",
                    size: 28.0,
                    color: Colors.white
                  )
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.bold(
                      text: "The best new releases",
                      size: 18.0,
                      color: Colors.white
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 16.0),
                          width: 164,
                          child: Column(
                            children: [
                              Container(
                                height: 164,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyShowsImage1),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),

                              const SizedBox(height: 8.0),

                              AppTexts.bold(
                                text: "Freaky Friday: A New Musical",///Todo: from backend
                                size: 12.0,
                                color: Colors.white,
                                align: TextAlign.center
                              ),

                              AppTexts.medium(
                                text: "348,486 FOLLOWERS",///Todo: from backend
                                size: 12.0,
                                color: AppColors.spotifyGrey,
                                align: TextAlign.center
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40.0),

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTexts.bold(
                      text: "New albums & singles",
                      size: 18.0,
                      color: Colors.white
                    ),
                  ),

                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(14, (index) {
                      return SizedBox(
                        width: 164,
                        child: Column(
                          children: [
                            Container(
                              height: 164,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.dummyCoverImage1),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            AppTexts.bold(
                              text: "Tanhaji - The Unsung Warrior",///Todo: from backend
                              size: 12.0,
                              color: Colors.white,
                              align: TextAlign.center
                            ),

                            AppTexts.medium(
                              text: "Mehul Vyas",///Todo: from backend
                              size: 12.0,
                              color: AppColors.spotifyGrey,
                              align: TextAlign.center
                            )
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
