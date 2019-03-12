import 'dart:math';

import 'package:flutter/material.dart';

class SliverScreen extends StatefulWidget {
  @override
  _SliverScreenState createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          _buildSliverToBoxAdapter(),
          _buildSliverGrid(context),
          _buildSliverPersistentHeader(),
          _buildSliverFixedExtentList(context),
          _buildSliverFillViewport(),
        ],
      ),
    );
  }

  Widget _buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 180.0,
        child: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Text('Header'),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
//      floating: true,
      pinned: true,
      backgroundColor: Colors.blueAccent.withOpacity(0.8),
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          collapseMode: CollapseMode.none,
          title: Text('Sliver Demo'),
          background: Image.network(
            "https://www.snapphotography.co.nz/wp-content/uploads/New-Zealand-Landscape-Photography-prints-12.jpg",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100.0,
        color: Colors.pinkAccent.withOpacity(0.8),
        child: Center(
            child: Text(
          'SliverToBoxAdapter',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        )),
      ),
    );
  }

  Widget _buildSliverGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightGreen[100 * (index % 10)],
            child: Text('Sliver Grid Item $index'),
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget _buildSliverFixedExtentList(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 80.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 10)],
          child: Text('Sliver Fixed Extent List Item $index'),
        );
      }, childCount: 10),
    );
  }

  Widget _buildSliverFillViewport() {
    return SliverFillViewport(
      delegate: SliverChildListDelegate([
        Container(
          color: Colors.pinkAccent.withOpacity(0.8),
          child: Center(
              child: Text(
            'SliverFillViewport',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          )),
        ),
      ]),
      viewportFraction: 1.0,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
