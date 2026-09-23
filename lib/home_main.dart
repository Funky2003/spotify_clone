import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/features/home/home_screen.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  final PageController _pageController = PageController();

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(
        child: Text(
          "Search",
          style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        )
    ),
    Center(
        child: Text(
          "Library",
          style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        )
    ),
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
            child: Container(
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
