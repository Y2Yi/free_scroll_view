import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_scroll_compat/multi_sliver_compat/shame_scroll_controller.dart';

typedef SliverCompatBuilder = Function(BuildContext, SliverCompat);

class MultiSliverCompatWidget extends StatefulWidget {
  final SliverCompatBuilder childBuilder;

  const MultiSliverCompatWidget({super.key, required this.childBuilder});

  @override
  State<MultiSliverCompatWidget> createState() =>
      _MultiSliverCompatWidgetState();
}

typedef MultiSliverCompatDelegate = _MultiSliverCompatWidgetState;

class _MultiSliverCompatWidgetState extends State<MultiSliverCompatWidget> {
  late SliverCompat _sliverCompat;

  @override
  void initState() {
    super.initState();
    _sliverCompat = SliverCompat();
  }

  @override
  Widget build(BuildContext context) {
    return widget.childBuilder(context, _sliverCompat);
  }

  static SliverCompat ofNotNull(BuildContext context) => context
      .findAncestorStateOfType<MultiSliverCompatDelegate>()!
      ._sliverCompat;
}

class SliverCompat {
  MultiSliverCompatScrollController? _majorScrollController;

  final HashMap<Key, MultiSliverCompatScrollController> _scrollPool = HashMap();

  ScrollController generateMajorController() {
    _majorScrollController ??=
        MultiSliverCompatScrollController.major(const Key("Major"), this);
    return _majorScrollController!;
  }

  ScrollController generateMinorController({required Key tag}) {
    if (_scrollPool[tag] != null) {
      return _scrollPool[tag]!;
    }
    MultiSliverCompatScrollController newController =
        MultiSliverCompatScrollController.minor(tag, this);
    _scrollPool[tag] = newController;
    return newController;
  }

  // 接收child提交的滚动量
  void submitUserOffset(
      MultiSliverCompatScrollPosition submitter, double delta) {
    double remaining = (_majorScrollController!.position as MajorScrollPosition)
        .applyClampedDragUpdate(delta);
    print('remaining:$remaining');
    if (remaining != 0) {
      remaining = submitter.applyClampedDragUpdate(remaining);
    }
    print('overflow:$remaining');
  }
}
