import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class SpotifySwitch extends StatefulWidget {
  const SpotifySwitch({super.key});

  @override
  State<SpotifySwitch> createState() => _SpotifySwitchState();
}

class _SpotifySwitchState extends State<SpotifySwitch> with SingleTickerProviderStateMixin {

  late final AnimationController _switchAnimationController;
  late final Tween<Offset> _switchOffset;

  bool _isToggled = false;

  @override
  void initState() {
    super.initState();

    _switchAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );

    _switchOffset = Tween(
        begin: Offset(-0.15, 0),
        end: Offset(0.5, 0)
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///Todo: Switch value
        setState(() {
          if (_switchAnimationController.isCompleted) {
            _switchAnimationController.reverse();
            _isToggled = false;
          } else {
            _switchAnimationController.forward();
            _isToggled = true;
          }
        });
      },
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 20.0,
        width: 28.0,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 14.0,
                  decoration: BoxDecoration(
                    color: _isToggled ? AppColors.spotifyGreenDeep : AppColors.spotifyGrey3,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: SlideTransition(
                  position: CurvedAnimation(
                    parent: _switchAnimationController,
                    curve: Curves.easeInOut
                  ).drive(_switchOffset),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: _isToggled ? AppColors.spotifyGreen : AppColors.spotifyGrey,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
