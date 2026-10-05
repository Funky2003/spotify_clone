import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_texts.dart';

import '../../../core/app_colors.dart';

class SearchActiveScreen extends StatefulWidget {
  const SearchActiveScreen({super.key});

  @override
  State<SearchActiveScreen> createState() => _SearchActiveScreenState();
}

class _SearchActiveScreenState extends State<SearchActiveScreen> {

  final FocusNode searchFocusNode = FocusNode();

  final List<String> results = [];

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
                              },
                              icon: Icon(
                                CupertinoIcons.camera,
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

            ///Recent searches
            if (results.isNotEmpty) ...[
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
                          children: List.generate(results.length, (index) {
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
            if (results.isEmpty) ...[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTexts.bold(
                        text: "Play what you love",
                        size: 20.0,
                        color: Colors.white
                      ),

                      const SizedBox(height: 16),

                      AppTexts.medium(
                        text: "Search for artist, podcast, and more.",
                        size: 12.0,
                        color: AppColors.spotifyGrey
                      )
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
