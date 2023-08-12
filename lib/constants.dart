import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor primaryColor =
      MaterialColor(0xFF1DB954, <int, Color>{});

  static const MaterialColor secondaryColor =
      MaterialColor(0xFF121212, <int, Color>{});

  static const MaterialColor secondarySwatchColor =
      MaterialColor(0xFF2A2A2A, <int, Color>{});
}

class Songs {
  static const Map<String, List<Map<String, String>>> songDetails = {
    'Arijit Singh': [
      {
        'name': 'Agar Tum Saath Ho (From Tamasha)',
        'image': 'assets/songs/arijitSingh/images/tamasha.jpg'
      },
      {
        'name': 'Phir Aur Kya Chahiye (From Zara Hatke Zara Bachke)',
        'image': 'assets/songs/arijitSingh/images/zara_hatke_zara bachke.jpg'
      },
      {
        'name': 'Kesariya',
        'image': 'assets/songs/arijitSingh/images/brahmashtra.jpg'
      },
      {
        'name': 'Humdard',
        'image': 'assets/songs/arijitSingh/images/ek_villan.jpg'
      },
      {
        'name': 'Tujhe Kitna Chahne Lage (From Kabir Singh)',
        'image': 'assets/songs/arijitSingh/images/kabir_singh.jpg'
      },
    ],
  };
}