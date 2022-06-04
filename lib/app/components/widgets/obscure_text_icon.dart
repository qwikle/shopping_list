import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ObscureText extends StatelessWidget {
  const ObscureText({
    Key? key,
    required this.obscure,
  }) : super(key: key);

  final Rx<bool> obscure;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        child: obscure.value
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onTap: () => obscure.toggle(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
