import 'package:flutter/material.dart';

abstract final class HomeSections {
  static final services = GlobalKey(debugLabel: 'home-services');
  static final about = GlobalKey(debugLabel: 'home-about');
  static final blog = GlobalKey(debugLabel: 'home-blog');

  static GlobalKey? keyFor(String section) => switch (section) {
    'services' => services,
    'about' => about,
    'blog' => blog,
    _ => null,
  };
}
