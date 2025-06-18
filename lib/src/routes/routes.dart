import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_pages.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    titulo: 'Slideshow',
    page: SlideshowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical,
    titulo: 'Emergencia',
    page: EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.slideshare,
    titulo: 'Encabezados',
    page: HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    titulo: 'Cuadro Animado',
    page: CuadradoAnimado(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    titulo: 'Barra progreso',
    page: GraficasCircularesPages(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    titulo: 'Pinterest',
    page: PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    titulo: 'Slivers',
    page: SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route({required this.icon, required this.titulo, required this.page});
}
