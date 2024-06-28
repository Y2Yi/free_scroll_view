import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_scroll_compat/multi_sliver_compat/sliver_compat.dart';

class ShameScrollController extends ScrollController {
  Key? debugKey;
  SliverCompat sliverCompat;

  ShameScrollController(this.sliverCompat, {this.debugKey});

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition? oldPosition) {
    return ShameScrollPosition(sliverCompat,
        physics: const ScrollPhysics(), context: context, debugKey: debugKey);
  }
}

class ShameScrollPosition extends ScrollPositionWithSingleContext {
  SliverCompat sliverCompat;
  Key? debugKey;

  ShameScrollPosition(this.sliverCompat,
      {required super.physics, required super.context, this.debugKey});

  @override
  void applyUserOffset(double delta) {
    print("$debugKey is applyUserOffset::$delta");
    super.applyUserOffset(delta);
  }
}
