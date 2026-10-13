import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';
import 'package:spotify_clone/features/album/album_songs_screen.dart';
import 'package:spotify_clone/features/artist/artist_screen.dart';
import 'package:spotify_clone/features/library/screens/liked_songs_screen.dart';
import 'package:spotify_clone/features/library/screens/local_files_screen.dart';
import 'package:spotify_clone/features/library/screens/your_episodes_screen.dart';
import 'package:spotify_clone/features/playlist/playlist_screen.dart';
import 'package:spotify_clone/features/podcast/podcast_details.dart';


class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {


  final List<String> libraryCategories = [
    'Playlists',
    'Podcast & Shows',
    'Artists',
    'Sports',
    'Health & Fitness',
    'Business',
    'Education',
    'History',
  ];

  List<String> spotifyLibrary = [
    // Liked Songs & Collection Hubs
    "Liked Songs",
    "Local Files",

    // Playlists
    "Your Episodes",
    "New Episodes",

    "Playlists",
    "Album",
    "Podcast",

    // Followed Artists
    "Artist",

    "add artist",
    "add podcast",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 8.0),
              child: AppBar(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      AppAssets.dummyArtistProfileImage1
                  ),
                ),
                title: AppTexts.bold(
                    text: "Your Library",
                    size: 20,
                    color: Colors.white
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        ///Todo: Search
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      )
                  ),

                  IconButton(
                      onPressed: () {
                        ///Todo: Add
                      },
                      icon: Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                      )
                  )
                ],
              ),
            ),

            ///Categories
            Container(
              height: 56,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(libraryCategories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextButton(
                        onPressed: () {
                          ///Todo: Select this
                        },
                        style: TextButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.spotifyGrey.withValues(alpha: .5)
                          )
                        ),
                        child: AppTexts.medium(
                          text: libraryCategories[index],
                          size: 12.0,
                          color: Colors.white
                        )
                      ),
                    );
                  }),
                ),
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ///Todo: do something
                  },
                  icon: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        size: 18,
                        color: Colors.white,
                      ),

                      const SizedBox(width: 4.0),

                      AppTexts.medium(
                        text: "Recents",
                        size: 12.0,
                        color: Colors.white
                      )
                    ],
                  )
                ),

                IconButton(
                  onPressed: () {
                    ///Todo:
                  },
                  icon: Icon(
                    Icons.list,
                    color: Colors.white,
                  )
                )
              ],
            ),

            ///Grid items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24.0,
                  mainAxisSpacing: 32.0,
                  childAspectRatio: .8
                ),
                children: List.generate(spotifyLibrary.length, (index) {

                  if (spotifyLibrary[index] == "Liked Songs") {
                    return _buildLikedSongsContainer();
                  }

                  if (spotifyLibrary[index] == "Local Files") {
                    return _buildLocalFilesContainer();
                  }

                  if (spotifyLibrary[index] == "Your Episodes" || spotifyLibrary[index] == "New Episodes") {
                    return _buildEpisodesContainer(title: spotifyLibrary[index]);
                  }

                  if (spotifyLibrary[index] == "Playlists") {
                    return _buildPlaylistsContainer();
                  }
                  
                  if (spotifyLibrary[index] == "Album") {
                    return _buildAlbumContainer();
                  }
                  
                  if (spotifyLibrary[index] == "Podcast") {
                    return _buildPodcastContainer();
                  }

                  if (spotifyLibrary[index] == "Artist") {
                    return _buildArtistContainer();
                  }

                  if (spotifyLibrary[index] == "add artist") {
                    return _buildAddArtistContainer();
                  }

                  if (spotifyLibrary[index] == "add podcast") {
                    return _buildAddPodcastAndShowsContainer();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemYellow
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      AppTexts.medium(
                        text: "Liked Songs",
                        color: Colors.white
                      ),

                      const SizedBox(height: 4.0),

                      Row(
                        children: [
                          Transform.rotate(
                            angle: 120,
                            child: Icon(
                              Icons.push_pin_rounded,
                              color: AppColors.spotifyGreen,
                              size: 18.0,
                            ),
                          ),

                          const SizedBox(width: 2),

                          Icon(
                            Icons.download_for_offline,
                            color: AppColors.spotifyGreen,
                            size: 16.0,
                          ),

                          const SizedBox(width: 2),

                          Expanded(
                            child: AppTexts.medium(
                              text: "Playlist • 22 tracks",
                              size: 12.0,
                              color: AppColors.spotifyGrey,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),


            ///Leave a space at the bottom
            const SizedBox(height: 240)
          ],
        ),
      ),
    );
  }

  Widget _buildLikedSongsContainer() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (route) => const LikedSongsScreen())
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 49, 97],
                colors: [
                  const Color(0xEE4202F5).withValues(alpha: .74),
                  const Color(0xEECA9AF0).withValues(alpha: .5),
                  const Color(0xEEC0EAC9).withValues(alpha: .74),
                ]
              )
            ),
            child: Center(
              child: ImageIcon(
                AssetImage(AppAssets.filledFavoriteIcon),
                color: Colors.white,
                size: 54.0,
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
              text: "Liked Songs",
              color: Colors.white
          ),

          const SizedBox(height: 4.0),

          Row(
            children: [
              Transform.rotate(
                angle: 120,
                child: Icon(
                  Icons.push_pin_rounded,
                  color: AppColors.spotifyGreen,
                  size: 18.0,
                ),
              ),

              const SizedBox(width: 2),

              Expanded(
                child: AppTexts.medium(
                    text: "Playlist • 22 tracks",
                    size: 12.0,
                    color: AppColors.spotifyGrey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLocalFilesContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (route) {
            return const LocalFilesScreen();
          })
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xEE1E3264)
            ),
            child: Center(
              child: Icon(
                Icons.folder,
                color: AppColors.spotifyGreen,
                size: 56.0,
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "Local Files",
            color: Colors.white
          ),

          const SizedBox(height: 4.0),

          Row(
            children: [
              Transform.rotate(
                angle: 120,
                child: Icon(
                  Icons.push_pin_rounded,
                  color: AppColors.spotifyGreen,
                  size: 18.0,
                ),
              ),

              const SizedBox(width: 2),

              Icon(
                Icons.download_for_offline,
                color: AppColors.spotifyGreen,
                size: 16.0,
              ),

              const SizedBox(width: 2),

              Expanded(
                child: AppTexts.medium(
                    text: "Playlist • 22 tracks",
                    size: 12.0,
                    color: AppColors.spotifyGrey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEpisodesContainer({required String title})  {

    final isYourEpisode = title == "Your Episodes";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (route) {
                return const YourEpisodesScreen();
              })
            );
          },
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: isYourEpisode
                  ? Color(0xEE006450)
                  : Color(0xEE64397E),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Icon(
                isYourEpisode
                    ? CupertinoIcons.bookmark_solid
                    : CupertinoIcons.bell_fill,
                color: AppColors.spotifyGreen,
                size: 56,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16.0),

        AppTexts.medium(
          text: isYourEpisode ? "Your Episodes" : "New Episodes",
          color: Colors.white
        ),

        const SizedBox(height: 4.0),

        Row(
          children: [
            if (isYourEpisode) ...[
              Transform.rotate(
                angle: 120,
                child: Icon(
                  Icons.push_pin_rounded,
                  color: AppColors.spotifyGreen,
                  size: 18.0,
                ),
              ),

              const SizedBox(width: 2),
            ],

            Expanded(
              child: AppTexts.medium(
                text: isYourEpisode ? "Saved & downloaded" : "Updated today",
                size: 12.0,
                color: AppColors.spotifyGrey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPlaylistsContainer() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (route) => const PlaylistScreen())
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Center(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(4, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          index == 0
                              ? AppAssets.dummyCoverImage1
                              : index == 1
                              ? AppAssets.dummyPodcastCover2
                              : index == 2
                              ? AppAssets.dummyCoverImage3
                              : AppAssets.dummyCoverImage4
                        )
                      )
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "My playlist 01",
            color: Colors.white
          ),

          const SizedBox(height: 4.0),

          Row(
            children: [
              Expanded(
                child: AppTexts.medium(
                  text: "Playlist • Ravi",
                  size: 12.0,
                  color: AppColors.spotifyGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  
  Widget _buildAlbumContainer() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (route) => const AlbumSongsScreen())
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.dummyMjCover)
              )
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "Dangerous",///Todo: from backend
            color: Colors.white
          ),

          const SizedBox(height: 4.0),

          Row(
            children: [
              Expanded(
                child: AppTexts.medium(
                  text: "Album • Michael Jackson",
                  size: 12.0,
                  color: AppColors.spotifyGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  
  Widget _buildPodcastContainer() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (route) => PodcastDetails(albumCoverRef: AppAssets.dummyPodcastCover2))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.dummyPodcastCover2),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "The Future with Chris Do",///Todo: from backend
            color: Colors.white
          ),

          const SizedBox(height: 4.0),

          Row(
            children: [
              Expanded(
                child: AppTexts.medium(
                  text: "Podcast • The Future",///Todo: from backend
                  size: 12.0,
                  color: AppColors.spotifyGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildArtistContainer() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (route) => const ArtistScreen())
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppAssets.dummyArtistImage2)
              )
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "Sam Smith",///Todo: From backend
            color: Colors.white
          ),

          const SizedBox(height: 4.0),

          AppTexts.medium(
            text: "Artist",
            size: 12.0,
            color: AppColors.spotifyGrey,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
          ),
        ],
      ),
    );
  }

  Widget _buildAddArtistContainer() {
    return GestureDetector(
      onTap: () {
        ///Todo: add new artist
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xEE2A2A2A),
              shape: BoxShape.circle
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.plus,
                color: AppColors.spotifyGrey,
                size: 56.0,
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "Add Artist",
            color: Colors.white
          ),
        ],
      ),
    );
  }

  Widget _buildAddPodcastAndShowsContainer() {
    return GestureDetector(
      onTap: () {
        ///Todo: add new podcast or show
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xEE2A2A2A),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.plus,
                color: AppColors.spotifyGrey,
                size: 56.0,
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          AppTexts.medium(
            text: "Add Podcast & Shows",
            color: Colors.white
          ),
        ],
      ),
    );
  }
}
