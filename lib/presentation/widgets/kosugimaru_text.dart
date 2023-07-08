import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class KosugimaruText extends StatelessWidget {
  const KosugimaruText({super.key, required this.comment, required this.size});
  final String comment;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      comment,
      style: GoogleFonts.kosugiMaru(
          textStyle: Theme.of(context).textTheme.headlineMedium,
          color: Colors.black,
          fontSize: size),
    );
  }
}
