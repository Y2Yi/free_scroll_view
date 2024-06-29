import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_scroll_compat/multi_sliver_compat/sliver_compat.dart';
import 'package:free_scroll_compat/sliver_persistent_header_delegate.dart';

class RatingFragment extends StatelessWidget {
  const RatingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliverCompatWidget.asCommon(
        (context, sliverCompat) => CustomScrollView(
              controller: sliverCompat.generateMajorController(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomSliverPersistentHeaderDelegate(
                    minExtent: 52,
                    maxExtent: 52,
                    child: Container(
                      color: const Color(0xAAFFFFFF),
                      padding: const EdgeInsets.all(16.0),
                      child: const Row(
                        children: [
                          Text("好评"),
                          Text("差评"),
                          Text("中评"),
                          Text("其他评"),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (ctx, idx) => _buildRatingItem(ctx, idx),
                      childCount: 100),
                )
              ],
            ));
  }

  Widget _buildRatingItem(BuildContext ctx, int idx) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black54, width: 0.1)),
      padding: EdgeInsets.all(16),
      child: RatingCardItemWidget(),
    );
  }
}

class RatingCardItemWidget extends StatefulWidget {
  const RatingCardItemWidget({super.key});

  @override
  State<RatingCardItemWidget> createState() => _RatingCardItemWidgetState();
}

class _RatingCardItemWidgetState extends State<RatingCardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildUserInfo(), _buildRatingInfo(), _buildOperationPanel()],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          child: Icon(Icons.people),
        ),
        Text("${DateTime.now()}")
      ],
    );
  }

  Widget _buildRatingInfo() {
    return const Text(
      "HelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorld!",
      style: TextStyle(fontSize: 16, color: Colors.black54),
    );
  }

  Widget _buildOperationPanel() {
    return Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            SizedBox(
              width: 32,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ));
  }
}
