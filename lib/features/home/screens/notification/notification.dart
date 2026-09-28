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

  Map<int, bool> _likedItems = {};
  
  final List<BottomSheetItemModel> _bottomSheetItems = [
    BottomSheetItemModel(icon: CupertinoIcons.music_note_2, label: "Add to playlist"),
    BottomSheetItemModel(icon: Icons.download_for_offline_outlined, label: "Download"),
    BottomSheetItemModel(icon: Icons.check, label: "Mark as played"),
    BottomSheetItemModel(icon: Icons.share, label: "Share"),
    BottomSheetItemModel(icon: Icons.mic, label: "Go to podcast"),
    BottomSheetItemModel(icon: CupertinoIcons.plus, label: "Follow")
  ];
 
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              padding: const EdgeInsets.all(16.0),
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

                  if (_selectCategory.toLowerCase() == "music")...[
                    Column(
                      children: List.generate(13, (index) {
                        return _buildMusicTile(index: index);
                      }),
                    )
                  ],

                  if (_selectCategory.toLowerCase() == "podcasts & shows") ...[
                    Column(
                      children: List.generate(13, (index) {
                        return _buildPodcastTile(index: index);
                      }),
                    )
                  ],

                  if (_selectCategory.isEmpty) ...[
                    Column(
                      children: List.generate(13, (index) {

                        final isEven = (index % 2) == 0;

                        if (isEven) {
                          return _buildPodcastTile(index: index);
                        } else {
                          return _buildMusicTile(index: index);
                        }
                      }),
                    )
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showMusicCardBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.spotifyBlack.withValues(alpha: 1),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .8
      ),
      context: context,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          decoration: BoxDecoration(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Cover photo
                SizedBox(
                  width: 148,
                  child: Column(
                    children: [
                      Container(
                        height: 148,
                        width: 148,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAssets.dummyCoverImage7),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xEE736F72)
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ImageIcon(
                                  AssetImage(AppAssets.appIcon),
                                  color: Colors.white,
                                ),
                              ),

                              Expanded(
                                child: ImageIcon(
                                  AssetImage(AppAssets.musicBars),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///Title & subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    children: [
                      AppTexts.bold(
                        text: "Unholy (feat. Kim Petras)",
                        size: 16.0,
                        color: Colors.white
                      ),

                      AppTexts.regular(
                        text: "Sam Smith & Kim Petras",
                        size: 14.0,
                        color: AppColors.spotifyGrey
                      )
                    ],
                  ),
                ),

                ///Action tiles
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_bottomSheetItems.length, (index) {

                    final item = _bottomSheetItems[index];

                    return ListTile(
                      onTap: () {
                        ///Todo: Perform the action
                      },
                      leading: Icon(
                        item.icon,
                        color: AppColors.spotifyGrey,
                      ),
                      title: AppTexts.bold(
                        text: item.label,
                        size: 14,
                        color: Colors.white
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildMusicTile({required int index}) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
                            _likedItems.update(index, (val) => val = !val, ifAbsent: () => true);
                            setState(() {});
                          },
                          icon: ImageIcon(
                            AssetImage(
                              _likedItems[index] == null ? AppAssets.outlineFavoriteIcon :
                              _likedItems[index]! ? AppAssets.filledFavoriteIcon : AppAssets.outlineFavoriteIcon
                            ),
                            color: _likedItems[index] == null ? Colors.white : _likedItems[index]! ? AppColors.spotifyGreen : Colors.white,
                          )
                        ),
                        IconButton(
                          onPressed: () => _showMusicCardBottomSheet(),
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
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Divider(
              color: const Color(0xEE1D1D1D),
            ),
          )
        ],
      ),
    );
  }

  void _showPodcastBottomSheet() {
    showModalBottomSheet(
        backgroundColor: AppColors.spotifyBlack.withValues(alpha: 1),
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .8
        ),
        context: context,
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            decoration: BoxDecoration(),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Cover photo
                  SizedBox(
                    width: 148,
                    child: Column(
                      children: [
                        Container(
                          height: 148,
                          width: 148,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.dummyPodcastCover),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xEEACDB26)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ImageIcon(
                                    AssetImage(AppAssets.appIcon),
                                    color: Colors.white,
                                  ),
                                ),

                                Expanded(
                                  child: ImageIcon(
                                    AssetImage(AppAssets.musicBars),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Title & subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: [
                        AppTexts.bold(
                            text: "Unholy (feat. Kim Petras)",
                            size: 16.0,
                            color: Colors.white
                        ),

                        AppTexts.regular(
                            text: "Sam Smith & Kim Petras",
                            size: 14.0,
                            color: AppColors.spotifyGrey
                        )
                      ],
                    ),
                  ),

                  ///Action tiles
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_bottomSheetItems.length, (index) {

                      final item = _bottomSheetItems[index];

                      return ListTile(
                        onTap: () {
                          ///Todo: Perform the action
                        },
                        leading: Icon(
                          item.icon,
                          color: AppColors.spotifyGrey,
                        ),
                        title: AppTexts.bold(
                            text: item.label,
                            size: 14,
                            color: Colors.white
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildPodcastTile({required int index}) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
                                image: AssetImage(AppAssets.dummyPodcastCover),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),

                      const SizedBox(width: 8.0),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTexts.medium(
                                text: "2 days ago",
                                color: AppColors.spotifyGrey,
                                size: 10.0
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: AppTexts.medium(
                                  text: "The Design Convo Podcast",
                                  color: Colors.white,
                                  size: 14.0,
                                  overflow: TextOverflow.visible
                              ),
                            ),

                            AppTexts.medium(
                                text: "Shakthi Hari N V",
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
                    text: "Episode • 1 hr 13 mins",
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
                              ///Todo: Add
                              _likedItems.update(index, (val) => val = !val, ifAbsent: () => true);
                              setState(() {});
                            },
                            icon: Icon(
                              _likedItems[index] == null ? CupertinoIcons.add_circled : _likedItems[index]! ? CupertinoIcons.checkmark_alt_circle_fill : CupertinoIcons.add_circled,
                              color: _likedItems[index] == null ? AppColors.spotifyGrey : _likedItems[index]! ? AppColors.spotifyGreen : AppColors.spotifyGrey,
                            )
                        ),
                        IconButton(
                            onPressed: () {
                              ///Todo: Download
                            },
                            icon: Icon(
                              Icons.download,
                              color: AppColors.spotifyGrey,
                            )
                        ),
                        IconButton(
                            onPressed: () => _showPodcastBottomSheet(),
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
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Divider(
              color: const Color(0xEE1D1D1D),
            ),
          )
        ],
      )
    );
  }
}

class BottomSheetItemModel {
  final IconData icon;
  final String label;
  const BottomSheetItemModel({required this.icon, required this.label});
}