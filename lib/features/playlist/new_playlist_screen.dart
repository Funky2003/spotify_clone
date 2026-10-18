import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/core/app_colors.dart';
import 'package:spotify_clone/core/app_texts.dart';

class NewPlaylistScreen extends StatefulWidget {
  const NewPlaylistScreen({super.key});

  @override
  State<NewPlaylistScreen> createState() => _NewPlaylistScreenState();
}

class _NewPlaylistScreenState extends State<NewPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                const Color(0xEECDCDCD).withValues(alpha: .24),
                const Color(0xEE121212).withValues(alpha: .74)
              ]
            )
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 263,
                  margin: const .symmetric(horizontal: 46.0),
                  // color: Colors.indigo,
                  child: Column(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      AppTexts.bold(
                        text: "Give your playlist a name.",
                        size: 16.0,
                        color: Colors.white
                      ),

                      TextField(
                        autofocus: true,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          )
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              ///Todo:
                            },
                            child: AppTexts.regular(
                              text: "cancel".toUpperCase(),
                              size: 12.0,
                              color: Colors.white
                            )
                          ),

                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: AppTexts.regular(
                              text: "skip".toUpperCase(),
                              size: 12.0,
                              color: AppColors.spotifyGreen
                            )
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
