import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeChanger>().currentTheme;
    final layoutModel = context.watch<LayoutModel>().currentPage;

    return Scaffold(
      drawer: _MenuPrincipal(),
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(width: 300, height: double.infinity, child: _ListOpciones()),
          Container(
            width: 5,
            height: double.infinity,
            color: appTheme.iconTheme.color,
          ),
          Expanded(child: layoutModel),
        ],
      ),
    );
  }
}

class _ListOpciones extends StatelessWidget {
  const _ListOpciones();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeChanger>().currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return Divider(color: appTheme.primaryColorLight);
      },
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: FaIcon(
            pageRoutes[index].icon,
            color: appTheme.iconTheme.color,
          ),
          title: Text(pageRoutes[index].titulo),
          trailing: Icon(Icons.chevron_right, color: appTheme.iconTheme.color),
          onTap: () {
           context.read<LayoutModel>().currentPage = pageRoutes[index].page;
          },
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeChanger>();

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.iconTheme.color,
                child: Text(
                  'FH',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),

            Expanded(child: _ListOpciones()),

            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.iconTheme.color,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
                activeColor: appTheme.currentTheme.iconTheme.color,
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: appTheme.currentTheme.iconTheme.color,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                onChanged: (value) => appTheme.customTheme = value,
                activeColor: appTheme.currentTheme.iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
