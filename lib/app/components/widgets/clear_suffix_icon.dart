import 'package:flutter/material.dart';

class ClearSuffixIcon extends StatelessWidget {
  const ClearSuffixIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: const Icon(Icons.cancel_outlined),
      onTap: onTap,
    );
  }
}
