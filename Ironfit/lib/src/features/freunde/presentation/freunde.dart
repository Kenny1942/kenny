import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/features/freunde/presentation/dinamiclist.dart';

class Freunde extends StatefulWidget {
  final String title;
  final VoidCallback back;

  const Freunde({
    super.key,
    required this.title,
    required this.back,
  });

  @override
  State<Freunde> createState() => _FreundeState();
}

class _FreundeState extends State<Freunde> {
  @override
  Widget build(BuildContext context) {
    return Dinamiclist(
      back: widget.back,
    );
  }
}
