import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: PinterestMenu()));
  }
}

class PinterestGrid extends StatelessWidget {
  PinterestGrid({super.key});

  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _PinterestItem(index: index);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (index % 2 == 0) ? 180.0 : 260,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
