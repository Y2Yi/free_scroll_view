import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreFragment extends StatelessWidget {
  const StoreFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text("StoreFragment"),
    );
  }
}

class GoodsFragment extends StatelessWidget {
  const GoodsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              _buildMenu(64),
              _buildMenu(64),
              _buildMenu(64),
              _buildMenu(64),
              _buildMenu(64),
              _buildMenu(64),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            children: [
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
              _buildMenu(96),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMenu(double h) {
    return Container(
      height: h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Color.fromARGB(55, Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255)),
      ),
      alignment: Alignment.center,
      child: Text("${Random().nextInt(255)}"),
    );
  }
}

class RatingFragment extends StatelessWidget {
  const RatingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text("RatingFragment"),
    );
  }
}
