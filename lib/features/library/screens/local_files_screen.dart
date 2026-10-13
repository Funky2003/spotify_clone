import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class LocalFilesScreen extends StatefulWidget {
  const LocalFilesScreen({super.key});

  @override
  State<LocalFilesScreen> createState() => _LocalFilesScreenState();
}

class _LocalFilesScreenState extends State<LocalFilesScreen> {

  final Map<String, String> localSongs = {
    'Blinding Lights': 'The Weeknd',
    'Shape of You': 'Ed Sheeran',
    'Bohemian Rhapsody': 'Queen',
    'Stay': 'Kid LAROI & Justin Bieber',
    'Bad Guy': 'Billie Eilish',
    'Flowers': 'Miley Cyrus',
    'As It Was': 'Harry Styles',
    'Cruel Summer': 'Taylor Swift',
    'Starboy': 'The Weeknd',
    'Perfect': 'Ed Sheeran',
    'Believer': 'Imagine Dragons',
    'Someone You Loved': 'Lewis Capaldi',
    'Say You Won\'t Let Go': 'James Arthur',
    'Closer': 'The Chainsmokers',
    'God\'s Plan': 'Drake',
    'Lucid Dreams': 'Juice WRLD',
    'Sunflower': 'Post Malone & Swae Lee',
    'Dynamite': 'BTS',
    'Watermelon Sugar': 'Harry Styles',
    'Levitating': 'Dua Lipa',
    'Drivers License': 'Olivia Rodrigo'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEE073A28).withValues(alpha: .4),
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xEE073A28)
          ),
          child: Row(
            children: [
              BackButton(
                color: Colors.white,
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Action center
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xEE005536).withValues(alpha: .6),
                    const Color(0xEE121212).withValues(alpha: 0)
                  ]
                )
              ),
              child: Column(
                children: [
                  ///Searchbar
                  SizedBox(
                    height: 52,
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchBar(
                            onTapOutside: (_) => FocusScope.of(context).unfocus(),
                            elevation: WidgetStatePropertyAll(0),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                              )
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white.withValues(alpha: .1)
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Find in local files",
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
                        ),

                        const SizedBox(width: 8.0),

                        FilledButton(
                          onPressed: () => _showSortBottomSheet(),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white.withValues(alpha: .1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: AppTexts.bold(
                              text: "Sort",
                              size: 12.0,
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    ),
                  ),

                  ///Action buttons
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AppTexts.bold(
                          text: "Local Files",
                          size: 24.0,
                          color: Colors.white
                        ),

                        const SizedBox(height: 12.0),

                        AppTexts.medium(
                          text: '${23} Tracks',///Todo: from backend
                          size: 12.0,
                          color: AppColors.spotifyGrey
                        )
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: IconButton(
                                onPressed: () {
                                  ///Todo: Play songs
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: AppColors.spotifyGreen
                                ),
                                icon: Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color: AppColors.spotifyBlack,
                                )
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  ///Todo: Shuffle songs
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: .circle,
                                    color: AppColors.spotifyBlack1.withValues(alpha: 1)
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.shuffle,
                                      size: 10,
                                      color: AppColors.spotifyGreen,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),

            const SizedBox(height: 8.0),

            ///Local Songs
            ...localSongs.entries.map((song) {
              return ListTile(
                onTap: () {
                  ///Todo: Go to now playing
                },
                contentPadding: const EdgeInsets.only(left: 16.0),
                leading: Container(
                  height: 48,
                  width: 48,
                  color: const Color(0xEE2A2A2A),
                  child: Center(
                    child: Icon(
                      Icons.music_note,
                      color: AppColors.spotifyGrey,
                    ),
                  ),
                ),
                title: AppTexts.medium(
                  text: song.key,///Todo: from backend
                  size: 14.0,
                  color: Colors.white
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.download_for_offline,
                      color: AppColors.spotifyGreen,
                      size: 12.0,
                    ),

                    const SizedBox(width: 4.0),

                    AppTexts.medium(
                      text: song.value,///Todo: From backend
                      size: 10.0,
                      color: AppColors.spotifyGrey
                    )
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {
                      ///Todo: show details
                    },
                    icon: Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: AppColors.spotifyGrey,
                    ),
                  )
              );
            }),

            ///Leave a space below
            const SizedBox(height: 120)
          ],
        ),
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        backgroundColor: const Color(0xEE242424).withValues(alpha: 1),
        constraints: BoxConstraints(
            minWidth: double.infinity
        ),
        builder: (context) {

          String selectedOption = "Recents";

          return StatefulBuilder(builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.bold(
                    text: "Sort by",
                    size: 24.0,
                    color: Colors.white
                  ),

                  const SizedBox(height: 32.0),

                  ...<String>[
                    "Recents",
                    "Recently added",
                    "Alphabetical",
                    "Creator"
                  ].map((option) {

                    final isSelected = selectedOption == option;

                    return ListTile(
                      onTap: () {
                        ///Todo: select this option
                        setModalState(() => selectedOption = option);
                        debugPrint("OPTION: $selectedOption");
                      },
                      contentPadding: EdgeInsets.zero,
                      title: AppTexts.medium(
                          text: option,
                          size: 16.0,
                          color: isSelected ? AppColors.spotifyGreen : Colors.white
                      ),
                      trailing: isSelected ? Icon(
                        Icons.check,
                        color: AppColors.spotifyGreen,
                      ) : SizedBox.shrink(),
                    );
                  }),

                  const SizedBox(height: 20.0),

                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: AppTexts.bold(
                        text: "cancel".toUpperCase(),
                        size: 16.0,
                        color: AppColors.spotifyGrey
                      )
                    ),
                  )
                ],
              ),
            );
          });
        }
    );
  }
}
