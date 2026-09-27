import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  final List<String> _categories = [
    'Music',
    'Podcasts & Shows',
    'Audiobooks',
    'Social Features',
    'Jams',
    'Live Concerts & Events',
    'Virtual Events',
    'Spotify Experiences',
    'Merchandise',
    'Cultural News',
    'Spotify Features & Tips',
    'Offers & Bundles',
  ];

  String _selectCategory = "";

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bold(
                      text: "What's New",
                      size: 34.0,
                      color: Colors.white
                    ),

                    AppTexts.medium(
                      text: "The latest releases from artists, podcasts, and shows you follow.",
                      size: 12.0,
                      color: AppColors.spotifyGrey
                    )
                  ],
                ),
              ),

              ///Categories
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (_selectCategory.isNotEmpty) ...[

                        IconButton(
                          onPressed: () {
                            ///Todo: Clear selection
                            setState(() {
                              _selectCategory = "";
                            });
                          },
                          style: IconButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.spotifyGrey
                            )
                          ),
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          )
                        ),

                        const SizedBox(width: 8.0),

                        TextButton(
                          onPressed: () {
                            ///Todo: Select this cat
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.spotifyGreenDeep,
                            side: BorderSide(
                                color: AppColors.spotifyGreen
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: AppTexts.medium(
                                text: _selectCategory,
                                color: Colors.white,
                                size: 12.0
                            ),
                          )
                        )
                      ]
                      else ...[
                        ..._categories.map((cat) {

                          final _isSelected = _selectCategory == cat;

                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextButton(
                                onPressed: () {
                                  ///Todo: Select this cat
                                  setState(() {
                                    _selectCategory = cat;
                                  });
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: _isSelected ? AppColors.spotifyGreenDeep : Colors.transparent,
                                    side: BorderSide(
                                        color: _isSelected ? AppColors.spotifyGreen : AppColors.spotifyGrey
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: AppTexts.medium(
                                      text: cat,
                                      color: Colors.white,
                                      size: 12.0
                                  ),
                                )
                            ),
                          );
                        })
                      ]
                    ],
                  ),
                ),
              ),

              ///Items/Elements/Data...
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bold(
                      text: "Earlier",
                      size: 16.0
                    ),

                    const SizedBox(height: 16.0),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyCoverImage7),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),

                              const SizedBox(width: 8.0),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTexts.medium(
                                      text: "2 days ago",
                                      color: AppColors.spotifyGrey,
                                      size: 10.0
                                    ),

                                    AppTexts.medium(
                                      text: "Unholy (feat. Kim Petras) [Nova Twins Remix] [Nova Twins Remix]",
                                      color: Colors.white,
                                      size: 14.0,
                                      overflow: TextOverflow.visible
                                    ),

                                    AppTexts.medium(
                                      text: "Sam Smith",
                                      color: AppColors.spotifyGrey,
                                      size: 12.0
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8.0),

                        AppTexts.medium(
                          text: "Single",
                          size: 10.0,
                          color: AppColors.spotifyGrey
                        ),

                        const SizedBox(height: 8.0),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: IntrinsicWidth(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ///Todo: Like this item
                                  },
                                  icon: ImageIcon(
                                    AssetImage(AppAssets.outlineFavoriteIcon),
                                    color: Colors.white,
                                  )
                                ),
                                IconButton(
                                  onPressed: () {
                                    ///Todo: Open bottomSheet
                                  },
                                  icon: Icon(
                                    CupertinoIcons.ellipsis_vertical,
                                    color: AppColors.spotifyGrey,
                                  )
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              ///Todo: Open bottomSheet
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white
                            ),
                            icon: Icon(
                              CupertinoIcons.play_arrow_solid,
                              color: AppColors.spotifyBlack,
                            )
                          ),
                        )
                      ],
                    ),
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
