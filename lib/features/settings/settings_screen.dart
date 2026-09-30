import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/shared/spotify_switch.dart';

import '../../core/app_texts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          decoration: BoxDecoration(
            color: AppColors.spotifyBlack1
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
              ),
              AppTexts.bold(
                text: "Settings",
                size: 20.0,
                color: Colors.white
              ),

              IconButton(
                onPressed: null,
                icon: Icon(null)
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Go premium
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTexts.bold(
                        text: "Free Account",
                        size: 20.0,
                        color: Colors.white
                      ),

                      const SizedBox(height: 16.0),

                      FilledButton(
                        onPressed: () {
                          ///Todo: Go premium
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white
                        ),
                        child: AppTexts.bold(
                          text: "Go Premium",
                          size: 12.0,
                          color: AppColors.spotifyBlack
                        )
                      )
                    ],
                  ),
                ),
              ),

              ///User profile tile
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    ///Todo: Go to profile
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AppAssets.dummyArtistProfileImage1)
                              )
                            ),
                          ),

                          const SizedBox(width: 16.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.bold(
                                  text: "Ravi",
                                  size: 24.0,
                                  color: Colors.white
                              ),


                              AppTexts.bold(
                                  text: "View Profile",
                                  size: 12.0,
                                  color: AppColors.spotifyGrey
                              )
                            ],
                          )
                        ],
                      ),

                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.spotifyGrey,
                      )
                    ],
                  ),
                ),
              ),

              ///
              _buildTile(
                title: "Data Saver",
                children: [
                  TileModel(
                    title: "Audio Quality",
                    subTittle: "Sets your audio quality to low (equivalent to 24kbit/s) and disables artist canvases."
                  )
                ]
              ),

              _buildTile(
                title: "Video Podcasts",
                children: [
                  TileModel(title: "Download Audio Quality", subTittle: "Save video podcasts as audio only"),
                  TileModel(title: "Stream Audio Only", subTittle: "Play video podcasts as audio only when not on WiFi."),
                ]
              ),

              _buildTile(
                title: "Playback",
                children: [
                  TileModel(title: "Crossfade", subTittle: "Allows you to crossfade between songs"),
                  TileModel(title: "Gapless", subTittle: "Allows gapless playback"),
                  TileModel(title: "Automix", subTittle: "Allows seamless transitions between songs on select playlists."),
                  TileModel(title: "Allow Explicit Content", subTittle: "Turn on to play explicit content"),
                  TileModel(title: "Show unplayable songs", subTittle: "Shows songs that are unplayable."),
                  TileModel(title: "Normalize volume", subTittle: "Set the same volume level for all tracks"),
                  TileModel(title: "Mono Audio", subTittle: "Makes the left and right speakers play the same audio."),
                  TileModel(title: "Device Broadcast Status", subTittle: "Allow other apps on your device to see what you are listening to."),
                  TileModel(title: "Auto Play", subTittle: "Enjoy nonstop listening. When your audio ends, we’ll play you something similar."),
                  TileModel(title: "Canvas", subTittle: "Display short, looping visuals on tracks."),
                ]
              ),

              _buildTile(
                title: "Languages",
                children: [
                  TileModel(
                    title: "Languages",
                    subTittle: "Choose your preferred language for music",
                    showSwitch: false
                  ),
                ]
              ),

              _buildTile(
                title: "Devices",
                children: [
                  TileModel(title: "Connect to a device", subTittle: "Listen to and control Spotify on your devices.", showSwitch: false),
                  TileModel(title: "Show local devices only", subTittle: "Only show devices on your local WiFi or ethernet in the devices menu."),
                  TileModel(title: "Spotify Connect in background", subTittle: "Allow Spotify Connect to keep Spotify running when the app is in background"),
                ]
              ),

              _buildTile(
                title: "Voice Assistants & Apps",
                children: [
                  TileModel(title: "Navigation & Other Apps", subTittle: "Connect with navigation and other apps to enhance your listening experience.", showSwitch: false),
                  TileModel(title: "Car", subTittle: "Always pay full attention to the road and abide with all traffic regulations.", showSwitch: false),
                  TileModel(title: "Car Thing", subTittle: "Set up and manage your Car Thing", showSwitch: false),
                ]
              ),

              _buildTile(
                title: "Social",
                children: [
                  TileModel(title: "Private Session", subTittle: "Start a private session to listen anonymously."),
                  TileModel(title: "Listening activity", subTittle: "Share what I listen to with my followers on Spotify."),
                ]
              ),

              _buildTile(
                title: "Notifications",
                children: [
                  TileModel(title: "Notifications", subTittle: "Choose which notifications to receive.", showSwitch: false)
                ]
              ),

              _buildTile(
                title: "Local Files",
                children: [
                  TileModel(title: "Show audio files from this device", subTittle: "Add tracks from this device into Your Library.")
                ]
              ),

              _buildTile(
                title: "Advertisement",
                children: [
                  TileModel(title: "Spotify Ad Partner Preference", subTittle: "Control how ads are targeted to me based on information gathered from advertising partners.", showSwitch: false)
                ]
              ),

              _buildTile(
                title: "About",
                children: [
                  TileModel(title: "Version", subTittle: "1.0.1+4", showSwitch: false),
                  TileModel(title: "Third-party software", subTittle: "Sweet software that helped us", showSwitch: false),
                  TileModel(title: "Terms and Conditions", subTittle: "All the stuff you need to know.", showSwitch: false),
                  TileModel(title: "Privacy Policy", subTittle: "Important for both of us.", showSwitch: false),
                  TileModel(title: "Platform Rules", subTittle: "Help keep Spotify safe for all", showSwitch: false),
                  TileModel(title: "Support", subTittle: "Get help from us and the community.", showSwitch: false)
                ]
              ),

              _buildTile(
                title: "Other",
                children: [
                  TileModel(title: "Log out", subTittle: "You are logged in as Ravi", showSwitch: false)
                ]
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({required String title, List<TileModel>? children}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.bold(
            text: title,
            size: 16.0,
            color: Colors.white
          ),

          const SizedBox(height: 16.0),

          ...children!.map((tile) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: AppTexts.medium(
                text: tile.title,
                size: 16.0,
                color: Colors.white
              ),
              subtitle: AppTexts.medium(
                text: tile.subTittle,
                size: 12.0,
                color: AppColors.spotifyGrey
              ),
              trailing: tile.showSwitch! ? SpotifySwitch() : SizedBox.shrink(),
            );
          })
        ],
      ),
    );
  }
}

class TileModel {
  final String title;
  final String subTittle;
  bool? showSwitch;
  TileModel({required this.title, required this.subTittle, this.showSwitch = true});
}