import 'package:flutter/material.dart';

class BounceRefreshScrollPhysics extends ScrollPhysics {
  const BounceRefreshScrollPhysics({super.parent});

  @override
  BounceRefreshScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return BounceRefreshScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Prevent bouncing at the top edge when pulling down for refresh
    if (value < position.pixels && position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    // Allow normal bouncing within the content
    return super.applyBoundaryConditions(position, value);
  }
}
