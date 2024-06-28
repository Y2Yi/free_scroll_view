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
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            children: [
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
              _buildMenu(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMenu() {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Color.fromARGB(55, Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255)),
      ),
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
