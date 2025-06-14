import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [PinterestGrid(), _PinterestMenuLocation()]),
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    final mostrar = context.watch<_MenuModel>().mostrar;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: widthScreen,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.black,
            // activeColor: Colors.white,
            // inactiveColor: Colors.lightBlue,
            items: [
              PinterestButton(
                onPressed: () => print('Icon pie_chart'),
                icon: Icons.pie_chart,
              ),
              PinterestButton(
                onPressed: () => print('Icon search'),
                icon: Icons.search,
              ),
              PinterestButton(
                onPressed: () => print('Icon notifications'),
                icon: Icons.notifications,
              ),
              PinterestButton(
                onPressed: () => print('Icon supervised_user_circle'),
                icon: Icons.supervised_user_circle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(100, (index) => index);

  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // print('ScrollListener ${controller.offset}');

      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      controller: controller,
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

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
