import 'dart:async';

import 'package:flutter/material.dart';

class BlinkingWidget extends StatefulWidget {
  final Widget child;
  final TickerProvider vsync;
  final Duration? disablerAfter;
  final bool invisibleAfter;
  const BlinkingWidget({
    super.key,
    required this.child,
    required this.vsync,
    this.disablerAfter,
    this.invisibleAfter = false,
  });

  @override
  State<BlinkingWidget> createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<BlinkingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Timer? _timer;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat(reverse: true);

    if (widget.disablerAfter != null) {
      _timer = Timer(widget.disablerAfter!, () {
        debugPrint("finish");
        _animationController.reset();
        _animationController.value = widget.invisibleAfter ? 0 : 1;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animationController, child: widget.child);
  }
}
