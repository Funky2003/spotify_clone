import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/home/home_screen.dart';
import 'package:spotify_clone/features/library/library_screen.dart';
import 'package:spotify_clone/features/search/search_screen.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  final PageController _pageController = PageController();

  int _currentIndex = 0;

  double _sliderValue = 0.0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    Center(
        child: Text(
          "Premium",
          style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _pageController,
              children: _pages,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                ///Now playing container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14.0, right: 8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: AppColors.spotifyGrey2,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                        ),
                        title: AppTexts.bold(
                            text: "Remember The time", ///Todo: Replace with track name
                            size: 12.0
                        ),
                        subtitle: AppTexts.medium(
                            text: "Michael Jackson", ///Todo: Replace with artist's name
                            size: 12.0,
                            color: AppColors.spotifyGrey
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  ///Todo: Change current playing platform
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.devicesIcon),
                                  color: AppColors.spotifyGrey,
                                )
                            ),
                            IconButton(
                                onPressed: () {
                                  ///Todo: Change current playing platform
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.outlineFavoriteIcon),
                                  color: AppColors.spotifyGrey,
                                )
                            ),
                            IconButton(
                                onPressed: () {
                                  ///Todo: Change current playing platform
                                },
                                icon: ImageIcon(
                                  AssetImage(AppAssets.playIcon),
                                  color: AppColors.spotifyGrey,
                                )
                            )
                          ],
                        ),
                      ),

                      Slider(
                        value: _sliderValue,
                        onChanged: (val) {
                          ///Todo: Make use of the value
                          setState(() {
                            _sliderValue = val;
                          });
                        },
                        padding: EdgeInsets.only(bottom: 4.0, left: 4.0, right: 8.0),
                        thumbColor: AppColors.spotifyGrey,
                        activeColor: AppColors.spotifyGrey,
                      )
                    ],
                  ),
                ),

                ///Bottom nav
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: .75),
                        Colors.black
                      ]
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BottomNavigationBar(
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });

                        _pageController.jumpToPage(index);
                      },
                      elevation: 0,
                      currentIndex: _currentIndex,
                      backgroundColor: Colors.transparent,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.white,
                      unselectedItemColor: AppColors.spotifyGrey,
                      items: [
                        _buildNavBarItem(
                          iconRef: AppAssets.home,
                          activeIconRef: AppAssets.homeActive,
                          label: "Home"
                        ),

                        _buildNavBarItem(
                          iconRef: AppAssets.search,
                          activeIconRef: AppAssets.searchActive,
                          label: "Search"
                        ),

                        _buildNavBarItem(
                          iconRef: AppAssets.playlist,
                          activeIconRef: AppAssets.playlistActive,
                          label: "Your Library"
                        ),

                        _buildNavBarItem(
                          iconRef: AppAssets.appIcon,
                          activeIconRef: AppAssets.appIcon,
                          label: "Premium"
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String iconRef,
    required String activeIconRef,
    required String label
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(iconRef),
      ),
      activeIcon: ImageIcon(
        AssetImage(activeIconRef)
      ),
      label: label
    );
  }
}
