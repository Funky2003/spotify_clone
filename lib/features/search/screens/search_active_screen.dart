import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/artist/artist_screen.dart';

import '../../../core/app_colors.dart';

class SearchActiveScreen extends StatefulWidget {
  const SearchActiveScreen({super.key});

  @override
  State<SearchActiveScreen> createState() => _SearchActiveScreenState();
}

class _SearchActiveScreenState extends State<SearchActiveScreen> {

  final TextEditingController _editingController = TextEditingController();

  final FocusNode searchFocusNode = FocusNode();

  final List<String> results = [];

  final bool _showSearchOptions = true;

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

  String _selectedItemId = "";

  @override
  void dispose() {
    _editingController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///Searchbar
            Container(
              height: 64.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: searchFocusNode.hasFocus 
                    ? const Color(0xEE535353)
                    : const Color(0xEE282828)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: searchFocusNode.hasFocus
                      ? IconButton(
                    onPressed: () => FocusScope.of(context).unfocus(),
                    icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white
                    ),
                  )
                      : SizedBox.shrink(),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBar(
                        controller: _editingController,
                        focusNode: searchFocusNode,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        onChanged: (val) {
                          setState(() {
                            results.add(val);
                          });
                        },
                        elevation: WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStatePropertyAll(
                          searchFocusNode.hasFocus
                              ? Colors.transparent
                              : const Color(0xEE535353)
                        ),
                        textStyle: WidgetStatePropertyAll(
                            TextStyle(
                                color: Colors.white
                            )
                        ),
                        trailing: [
                          IconButton(
                            onPressed: () {
                              ///Todo: Search by photo
                              if (results.isNotEmpty) {
                                _selectedItemId = "";
                                results.clear();
                                _editingController.clear();
                                setState(() => {});
                              }
                            },
                            icon: Icon(
                              results.isNotEmpty
                                  ? Icons.close_rounded
                                  : CupertinoIcons.camera,
                              color: Colors.white,
                            )
                          )
                        ],
                        hintText: "What do you want to listen to?",
                        hintStyle: WidgetStatePropertyAll(
                            TextStyle(
                                color: Colors.white
                            )
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              searchFocusNode.hasFocus
                                ? 0
                                : 4
                            )
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Searched items
            if (results.isNotEmpty) ...[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///Categories
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(_categories.length, (index) {

                              final _isSelected = _selectedItemId == _categories[index];

                              return Padding(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                  left: index == 0
                                      ? 16.0
                                      : 0
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    ///Todo: Select item
                                    _selectedItemId = _categories[index];
                                    setState(() => {});
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    side: BorderSide(
                                      color: _isSelected
                                          ? AppColors.spotifyGreen
                                          : AppColors.spotifyGrey
                                    ),
                                    backgroundColor: _isSelected
                                        ? AppColors.spotifyGreenDeep
                                        : Colors.transparent
                                  ),
                                  child: AppTexts.medium(
                                    text: _categories[index],
                                    size: 12.0,
                                    color: Colors.white
                                  )
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                      ///Artist
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (route) {
                              return const ArtistScreen();
                            })
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 54,
                                width: 54,
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemYellow,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.dummyArtistImage2)
                                  )
                                ),
                              ),

                              const SizedBox(width: 12.0),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppTexts.medium(
                                        text: "Sam Smith",///Todo: from backend
                                        size: 14.0,
                                        color: Colors.white
                                      ),

                                      const SizedBox(width: 4.0),

                                      ImageIcon(
                                        AssetImage(AppAssets.verifiedBadge),
                                        size: 14.0,
                                        color: AppColors.spotifyBlue,
                                      )
                                    ],
                                  ),

                                  AppTexts.medium(
                                    text: "Artist",
                                    size: 12.0,
                                    color: AppColors.spotifyGrey
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      ///Artist Features
                      Container(
                        height: 217,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTexts.bold(
                              text: "Featuring ${"Sam Smith"}",///Todo: Name from backend
                              size: 16.0,
                              color: Colors.white
                            ),

                            const SizedBox(height: 16.0),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(7, (index) {
                                  return Container(
                                    width: 114,
                                    margin: const EdgeInsets.only(right: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 114,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(AppAssets.dummyArtistImage6)
                                              )
                                          ),
                                        ),

                                        const SizedBox(height: 8.0),

                                        AppTexts.bold(
                                          text: "Unholy",///Todo: From backend
                                          size: 12.0,
                                          color: Colors.white
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///Others
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: List.generate(13, (index) {

                            final _isArtist = (index%2) == 0;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (route) {
                                    return const ArtistScreen();
                                  })
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 54,
                                      width: 54,
                                      decoration: BoxDecoration(
                                        shape: _isArtist
                                            ? BoxShape.circle
                                            : BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            _isArtist
                                              ? AppAssets.dummyArtistImage2
                                              : AppAssets.dummyArtistProfileImage1
                                          )
                                        )
                                      ),
                                    ),

                                    const SizedBox(width: 12.0),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AppTexts.medium(
                                                text: "Sam Smith",///Todo: from backend
                                                size: 14.0,
                                                color: Colors.white
                                            ),

                                            const SizedBox(width: 4.0),

                                            ImageIcon(
                                              AssetImage(AppAssets.verifiedBadge),
                                              size: 14.0,
                                              color: AppColors.spotifyBlue,
                                            )
                                          ],
                                        ),

                                        AppTexts.medium(
                                            text: "Artist",
                                            size: 12.0,
                                            color: AppColors.spotifyGrey
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],

            ///Recent searches
            if (results.isEmpty) ...[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Label
                        Padding(
                          padding: const EdgeInsets.only(top: 32, bottom: 20),
                          child: AppTexts.bold(
                            text: "Recent searches",
                            size: 16.0,
                            color: Colors.white
                          ),
                        ),

                        ///Search results
                        Column(
                          children: List.generate(3, (index) {
                            return ListTile(
                              onTap: () {
                                ///Todo: Select song
                              },
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset(AppAssets.dummyArtistImage9),
                              title: AppTexts.medium(
                                text: "Mi Gente",///Todo: From backend
                                size: 14.0,
                                color: Colors.white
                              ),
                              subtitle: AppTexts.medium(
                                text: "Song • J Balvin, Willy William",///Todo: From backend
                                size: 12.0,
                                color: AppColors.spotifyGrey
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  results.remove(results[index]);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.spotifyGrey,
                                )
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            results.clear();
                            setState(() {});
                          },
                          child: AppTexts.medium(
                            text: "Clear recent searches",
                            size: 16.0,
                            color: AppColors.spotifyGrey
                          )
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],

            ///Recent searches - No Results
            // if (results.isEmpty) ...[
            //   Expanded(
            //     child: Center(
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           AppTexts.bold(
            //             text: "Play what you love",
            //             size: 20.0,
            //             color: Colors.white
            //           ),
            //
            //           const SizedBox(height: 16),
            //
            //           AppTexts.medium(
            //             text: "Search for artist, podcast, and more.",
            //             size: 12.0,
            //             color: AppColors.spotifyGrey
            //           )
            //         ],
            //       ),
            //     ),
            //   )
            // ]
          ],
        ),
      ),
    );
  }
}
