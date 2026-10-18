import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 375,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    right: -40,
                    child: Transform.rotate(
                      angle: 0,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.dummyCoverPremium),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(AppAssets.appIcon),
                                  color: Colors.white,
                                  size: 16.0,
                                ),

                                const SizedBox(width: 8.0),

                                AppTexts.bold(
                                  text: "Premium",
                                  size: 14.0,
                                  color: Colors.white
                                )
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTexts.medium(
                                  text: "FREE TRIAL",
                                  size: 10.0,
                                  color: Colors.white
                                ),

                                AppTexts.medium(
                                  text: "Try Premium free for 1 month",
                                  size: 28.0,
                                  color: Colors.white
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: .symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 64,
                    padding: .symmetric(vertical: 8.0),
                    child: FilledButton(
                      onPressed: () {
                        ///Todo: Try premium
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.white
                      ),
                      child: AppTexts.bold(
                        text: "GET PREMIUM",
                        size: 16.0,
                        color: Colors.black
                      )
                    ),
                  ),

                  Text.rich(
                      style: TextStyle(
                          color: AppColors.spotifyGrey,
                          fontSize: 10
                      ),
                      TextSpan(
                          children: [
                            TextSpan(
                                text: "From ₹119/month after. Offer only for users who are new to Premium. "
                            ),
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                text: "Terms and Conditions apply."
                            )
                          ]
                      )
                  ),

                  const SizedBox(height: 12.0),

                  Container(
                    width: double.infinity,
                    padding: const .symmetric(vertical: 32.0),
                    decoration: BoxDecoration(
                      color: AppColors.spotifyBlack1,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppTexts.medium(
                            text: "Why join Premium?",
                            size: 16.0,
                            color: Colors.white
                          ),
                        ),

                        Divider(
                          height: 32,
                          thickness: .5,
                          color: AppColors.spotifyGrey,
                        ),

                        ...[
                          "Download to listen offline without wifi",
                          "Music without ad interruptions",
                          "2x higher sound quality than our free plan",
                          "Play songs in any order, with unlimited skips",
                          "Cancel monthly plans online anytime"
                        ].map((item) {
                          return ListTile(
                            leading: Icon(
                              Icons.check,
                              color: AppColors.spotifyGreen,
                            ),
                            title: AppTexts.medium(
                              text: item,
                              size: 10.0,
                              color: Colors.white
                            ),
                          );
                        })
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: ListTile(
                      tileColor: AppColors.spotifyBlack1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      leading: AppTexts.medium(
                        text: "Spotify Free",
                        size: 16.0,
                        color: Colors.white
                      ),
                      trailing: AppTexts.medium(
                        text: "CURRENT PLAN",
                        size: 10.0,
                        color: Colors.white
                      ),
                    ),
                  ),

                  ///Premium packages
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTexts.medium(
                        text: "Pick your Premium",
                        size: 16.0,
                        color: Colors.white
                      ),

                      const SizedBox(height: 32.0),

                      Container(
                        width: double.infinity,
                        padding: const .fromLTRB(32, 32, 32, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xEE203265).withValues(alpha: 1),
                              const Color(0xEEAA2895).withValues(alpha: .25),
                            ]
                          )
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTexts.medium(
                                  text: "Mini",
                                  size: 16.0,
                                  color: Colors.white
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppTexts.medium(
                                      text: "From ₹7",///Todo: from backend
                                      size: 24.0,
                                      color: Colors.white
                                    ),

                                    AppTexts.medium(
                                      text: "For 1 Day",///Todo: from backend
                                      size: 12.0,
                                      color: Colors.white
                                    ),
                                  ],
                                )
                              ],
                            ),

                            const SizedBox(height: 40),

                            AppTexts.medium(
                              text: "1 day and 1 week plans • Ad-free music on mobile • Download 30 songs on 1 mobile device • Mobile only plan",
                              size: 14.0,
                              color: Colors.white,
                              align: TextAlign.center
                            ),

                            const SizedBox(height: 20),

                            FilledButton(
                              onPressed: () {
                                ///Todo:
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white
                              ),
                              child: AppTexts.bold(
                                text: "view plans".toUpperCase(),
                                size: 16.0,
                                color: Colors.black
                              )
                            ),

                            const SizedBox(height: 16.0),

                            Text.rich(
                              style: TextStyle(
                                color: AppColors.spotifyGrey,
                                fontSize: 10.0
                              ),
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Prices vary according to duration of plan. "
                                  ),
                                  TextSpan(
                                    text: "Terms and Conditions apply.",
                                    style: TextStyle(
                                      color: Colors.white
                                    )
                                  )
                                ]
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),


            ///Leave a space down here
            const SizedBox(height: 240)
          ],
        ),
      ),
    );
  }
}
