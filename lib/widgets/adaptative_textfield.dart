import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function onSubmit;
  final TextInputType keyboardType;

  AdaptativeTextField({
    this.label,
    this.onSubmit,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CupertinoTextField(
              controller: controller,
              placeholder: label,
              keyboardType: keyboardType,
              onSubmitted: onSubmit,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmit,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
