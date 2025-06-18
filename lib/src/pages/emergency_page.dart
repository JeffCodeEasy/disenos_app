import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
    ];

    List<Widget> itemMap =
        items
            .map(
              (item) => FadeInLeft(
                child: BotonGordo(
                  texto: item.texto,
                  onPressed: () {},
                  icon: item.icon,
                  color1: item.color1,
                  color2: item.color2,
                ),
              ),
            )
            .toList();
    bool isLarge;
    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 200 : 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [(isLarge) ? SizedBox(height: 80) : SizedBox(height: 10), ...itemMap],
            ),
          ),
          if (isLarge) _PageHeader(),
        ],
      ),
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: 'Motor Accident',
      onPressed: () {},
      icon: FontAwesomeIcons.carBurst,
      color1: Color(0xff6989f5),
      color2: Color(0xff906ef5),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Médica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
