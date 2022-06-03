import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ObscureText extends StatelessWidget {
  const ObscureText({
    Key? key,
    required this.obscure,
    required this.onTap,
  }) : super(key: key);

  final Rx<bool> obscure;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: obscure.value
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
