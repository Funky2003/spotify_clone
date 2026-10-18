import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class ConnectedDevicesScreen extends StatefulWidget {
  const ConnectedDevicesScreen({super.key});

  @override
  State<ConnectedDevicesScreen> createState() => _ConnectedDevicesScreenState();
}

class _ConnectedDevicesScreenState extends State<ConnectedDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.close_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: .zero,
                leading: ImageIcon(
                  AssetImage(AppAssets.phoneIcon),
                  color: AppColors.spotifyGreen,
                ),
                title: AppTexts.bold(
                    text: "Current device",
                    size: 24.0,
                    color: Colors.white
                ),
                subtitle: AppTexts.bold(
                    text: "This device",
                    size: 14.0,
                    color: AppColors.spotifyGreen
                ),
              ),

              const SizedBox(height: 16.0),

              AppTexts.medium(
                  text: "Use your mobile device as a remote control.",
                  size: 14.0,
                  color: AppColors.spotifyGrey
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        margin: const .symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(
              Icons.volume_up_rounded,
              color: AppColors.spotifyGrey,
            ),

            Expanded(
              child: Slider(
                value: .3,
                onChanged: (val) {
                  ///Todo:
                },
                thumbColor: Colors.white,
                inactiveColor: AppColors.spotifyBlack1,
                activeColor: Colors.white,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: .centerDocked,
    );
  }
}
