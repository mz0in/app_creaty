import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.readOnly = false,
    this.enabled = true,
    this.haveBorder = true,
  });

  final TextEditingController? controller;

  final String? labelText;

  final bool readOnly;

  final bool enabled;

  final bool haveBorder;

  @override
  Widget build(BuildContext context) {
    final border = haveBorder ? const OutlineInputBorder() : null;
    return ColoredBox(
      color: Colors.white,
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          border: border,
          labelText: labelText,
          enabled: enabled,
        ),
      ),
    );
  }
}
