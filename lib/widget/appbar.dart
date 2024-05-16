

import 'package:flutter/material.dart';

AppBar appBar(String title, String rtTitle) {
  return AppBar(
  title: Text(title),
  actions: [
    TextButton(onPressed: () {}, child: Text(rtTitle))
  ],
  leading: BackButton()
  );
}