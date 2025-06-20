import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
       Expanded(child: _MiSlideshow()),
          Expanded(child: _MiSlideshow()),
    ];

    return Scaffold(
      body: ( isLarge ) 
              ? Column( children: children )
              : Row( children: children )
    );
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow();

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      puntosArriba: false,
      colorPrimario: Colors.orange,
      // colorSecundario: Colors.purple,
      bulletPrimario: 20,
      bulletSecundario: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
