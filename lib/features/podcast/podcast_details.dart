import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/podcast/podcast_episode_details.dart';

import '../../core/app_assets.dart';
import '../home/screens/notification/notification.dart';

class PodcastDetails extends StatefulWidget {

  final String albumCoverRef;

  const PodcastDetails({super.key, required this.albumCoverRef});

  @override
  State<PodcastDetails> createState() => _PodcastDetailsState();
}

class _PodcastDetailsState extends State<PodcastDetails> with TickerProviderStateMixin {

  int _currentTabIndex = 0;

  late AnimationController animationController;
  late Tween<Offset> _animation;

  late AnimationController animationController1;
  late Tween<Offset> _animation1;

  final List<BottomSheetItemModel> _bottomSheetItems = [
    BottomSheetItemModel(icon: CupertinoIcons.music_note_2, label: "Add to playlist"),
    BottomSheetItemModel(icon: Icons.download_for_offline_outlined, label: "Download"),
    BottomSheetItemModel(icon: Icons.check, label: "Mark as played"),
    BottomSheetItemModel(icon: Icons.share, label: "Share"),
    BottomSheetItemModel(icon: Icons.mic, label: "Go to podcast"),
    BottomSheetItemModel(icon: CupertinoIcons.plus, label: "Follow")
  ];

  @override
  void initState() {
    super.initState();

    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    )..forward();
    _animation = Tween(
        begin: Offset(1, 0),
        end: Offset.zero
    );

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
    _animation1 = Tween(
      begin: Offset(-1, 0),
      end: Offset.zero
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE606462).withValues(alpha: .4),
        leading: Container(
          color: const Color(0xEE606462).withValues(alpha: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xEE606462).withValues(alpha: 1),
                        const Color(0xEE121212).withValues(alpha: 0)
                      ]
                  )
              ),
              child: Column(
                children: [
                  ///Searchbar
                  SearchBar(
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    elevation: WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)
                        )
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                        Colors.white.withValues(alpha: .1)
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                    ),
                    hintText: "Find in this show",
                    hintStyle: WidgetStatePropertyAll(
                        TextStyle(
                            color: Colors.white
                        )
                    ),
                    textStyle: WidgetStatePropertyAll(
                        TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),

                  ///User profile
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      children: [
                        Container(
                          height: 164,
                          width: 164,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.albumCoverRef),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),

                        const SizedBox(width: 16.0),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.bold(
                                  text: "Maha Bharat with Dhruv Rathee",///Todo: From backend
                                  size: 28.0,
                                  color: Colors.white
                              ),

                              AppTexts.medium(
                                  text: "Spotify Studios", ///Todo: From backend
                                  size: 14,
                                  color: AppColors.spotifyGrey
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Action buttons
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            ///Todo: Follow podcast
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 1.5
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          child: AppTexts.medium(
                              text: "Follow",
                              size: 12.0,
                              color: Colors.white
                          )
                      ),

                      const SizedBox(width: 8.0),

                      IconButton(
                          onPressed: () {
                            ///Todo: Notify
                          },
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: AppColors.spotifyGrey,
                          )
                      ),

                      IconButton(
                          onPressed: () {
                            ///Todo: Notify
                          },
                          icon: Icon(
                            Icons.settings,
                            color: AppColors.spotifyGrey,
                          )
                      ),

                      IconButton(
                        onPressed: () {
                          _showPodcastBottomSheet();
                        },
                        icon: Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: AppColors.spotifyGrey,
                        )
                      )
                    ],
                  ),

                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        ///Todo: Use Text.rich to do this
                        AppTexts.medium(
                            text: "A Product Story is a podcast that explores the behind-the-scenes stories of how products are developed and brought to market at Spotify. A Product Story is a podcast that explores the behind-the-scenes stories of how products are developed and brought to market at Spotify",
                            size: 10.0,
                            color: AppColors.spotifyGrey,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis
                        ),

                        const SizedBox(height: 12.0),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: const Color(0xEE2A2A2A).withValues(alpha: 1),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Row(
                                children: [
                                  AppTexts.medium(
                                      text: "4.6",///Todo: From backend
                                      size: 12.0,
                                      color: Colors.white
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Icon(
                                      CupertinoIcons.star,
                                      size: 12.0,
                                      color: Colors.white,
                                    ),
                                  ),

                                  AppTexts.medium(
                                      text: "(${14}K)",///Todo: From backend
                                      size: 12.0,
                                      color: Colors.white
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: AppColors.spotifyGrey
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: const Color(0xEE2A2A2A).withValues(alpha: 1),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: AppTexts.medium(
                                  text: "Philosophy",///Todo: From backend
                                  size: 12.0,
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  ///Tab section
                  SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: _currentTabIndex == 0 ? Border(
                                      bottom: BorderSide(
                                          color: AppColors.spotifyGreen,
                                          width: 2
                                      )
                                  ) : null
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    ///Todo: select this tab
                                    setState(() => _currentTabIndex = 0);
                                    animationController1.forward();
                                    animationController.reverse();
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      )
                                  ),
                                  child: AppTexts.bold(
                                      text: "Episodes",
                                      size: 14.0,
                                      color: Colors.white
                                  )
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:  _currentTabIndex == 1 ? Border(
                                      bottom: BorderSide(
                                          color: AppColors.spotifyGreen,
                                          width: 2
                                      )
                                  ) : null
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    ///Todo: select this tab
                                    setState(() => _currentTabIndex = 1);
                                    animationController.forward();
                                    animationController1.reverse();
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      )
                                  ),
                                  child: AppTexts.bold(
                                      text: "More Like This",
                                      size: 14.0,
                                      color: Colors.white
                                  )
                              ),
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),

            if (_currentTabIndex == 0) ...[
              SlideTransition(
                position: CurvedAnimation(
                  parent: animationController1,
                  curve: Curves.easeInOut
                ).drive(_animation1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTexts.bold(
                            text: "All episodes",
                            size: 14.0,
                            color: Colors.white
                          ),

                          FilledButton(
                            onPressed: () {
                              ///Todo: Sort
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.spotifyButtonBgColor.withValues(alpha: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                              )
                            ),
                            child: AppTexts.medium(
                              text: "Sort",
                              size: 12.0,
                              color: AppColors.spotifyGrey
                            )
                          )
                        ],
                      ),

                      const SizedBox(height: 16.0),

                      Column(
                        children: List.generate(13, (index) {
                          return Column(
                            children: [

                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (route) {
                                    return PodcastEpisodeDetails(albumCoverRef: widget.albumCoverRef);
                                  })
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              image: DecorationImage(
                                                image: AssetImage(widget.albumCoverRef),
                                                fit: BoxFit.cover
                                              )
                                            ),
                                          ),

                                          const SizedBox(width: 12.0),

                                          Expanded(
                                            child: AppTexts.medium(
                                              text: "How much should we depend on our Nuclear power plants?",///Todo: from backend
                                              size: 14.0,
                                              color: Colors.white
                                            ),
                                          )
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                                        child: AppTexts.medium(
                                          text: "This is where the Spotify product story begins. In this episode, we dive into the world that set the stage for Spotify and the streaming music revolution",///Todo: From backend
                                          size: 10.0,
                                          color: AppColors.spotifyGrey
                                        ),
                                      ),

                                      AppTexts.medium(
                                        text: "Wed • 22 mins",
                                        size: 10.0,
                                        color: AppColors.spotifyGrey
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  ///Todo: Do something
                                                },
                                                child: Icon(
                                                  Icons.add_circle_outline_outlined,
                                                  color: AppColors.spotifyGrey,
                                                )
                                              ),

                                              const SizedBox(width: 8.0),

                                              IconButton(
                                                onPressed: () {
                                                  ///Todo: Do something
                                                },
                                                icon: Icon(
                                                  Icons.download_for_offline_outlined,
                                                  color: AppColors.spotifyGrey,
                                                )
                                              ),

                                              IconButton(
                                                onPressed: () {
                                                  ///Todo: Do something
                                                },
                                                icon: Icon(
                                                  Icons.share,
                                                  color: AppColors.spotifyGrey,
                                                )
                                              ),

                                              IconButton(
                                                onPressed: () {
                                                  ///Todo: Do something
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.ellipsis_vertical,
                                                  color: AppColors.spotifyGrey,
                                                )
                                              )
                                            ],
                                          ),

                                          InkWell(
                                            onTap: () {
                                              ///Todo: Do something
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                CupertinoIcons.play_arrow_solid,
                                                color: AppColors.spotifyBlack,
                                              ),
                                            )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              if (index != 12) ...[
                                Divider(
                                  height: 24,
                                  color: AppColors.spotifyGrey.withValues(alpha: .15),
                                )
                              ]
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                )
              )
            ],

            if (_currentTabIndex == 1) ...[
              const SizedBox(height: 8.0),

              SlideTransition(
                position: CurvedAnimation(
                  parent: animationController,
                  curve: Curves.easeInOut
                ).drive(_animation),
                child: Column(
                  children: List.generate(23, (index) {
                    return Container(
                      height: 90,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16.0, left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 90,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppAssets.dummyPodcastCover)
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),

                          const SizedBox(width: 12.0),

                          Expanded(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppTexts.medium(
                                    text: "Arts & Entertainment • Business & Technology • Design", ///Todo: from backend
                                    size: 10,
                                    color: AppColors.spotifyGreen
                                  ),

                                  AppTexts.bold(
                                    text: "STYLE AS IDENTITY",///Todo: from backend
                                    size: 12.0,
                                    color: Colors.white
                                  ),

                                  AppTexts.medium(
                                    text: "Introducing Past Lives, a new Spotify Design podcast series. Dive into the unexpected backgrounds of designers at Spotify.",///Todo: from backend
                                    size: 10.0,
                                    color: AppColors.spotifyGrey
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ]
          ],
        ),
      )
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
                                image: AssetImage(widget.albumCoverRef),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xEEFF1155)
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
}
