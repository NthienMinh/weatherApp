import 'package:flutter/material.dart';
import 'package:weather/resources/assets/assets.dart';
import 'package:weather/utils/resizable_utils.dart';

class LoadingIcon extends StatefulWidget {
  const LoadingIcon({super.key});

  @override
  State<LoadingIcon> createState() => _LoadingIconState();
}

class _LoadingIconState extends State<LoadingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        Assets.icons.main.iconLoading,
        width: Resizable.size(context, 96),
        height: Resizable.size(context, 96),
      ),
    );
  }
}
