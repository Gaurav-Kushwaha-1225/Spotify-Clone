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
        'image': 'assets/songs/arijitSingh/images/tamasha.jpg',
        'song': 'songs/arijitSingh/songs/agar_tum_saath_ho.mp3'
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
    'Iqlipse Nova': [
      {
        'name': 'Mera Safar',
        'image': 'assets/songs/iqlipseNova/images/mera_safar.jpg',
        'song': 'songs/iqlipseNova/songs/meraSafar.mp3'
      },
      {'name': 'Khwab', 'image': 'assets/songs/iqlipseNova/images/khwab.jpg'},
      {
        'name': 'Middle Class',
        'image': 'assets/songs/iqlipseNova/images/middle_class.jpg'
      },
      {
        'name': 'Aarzoo',
        'image': 'assets/songs/iqlipseNova/images/aarzoo.jpg',
        'song': 'songs/iqlipseNova/songs/aarzoo.mp3'
      },
      {
        'name': 'Khwab - Reprise',
        'image': 'assets/songs/iqlipseNova/images/khwab_reprise.jpg'
      },
    ],
    'The Ranveer Show': [
      {'name': 'Podcast No. - 150', 'image': 'assets/songs/trs/images/trs-150.jpg'},
      {'name': 'Podcast No. - 154', 'image': 'assets/songs/trs/images/trs-154.jpg'},
      {
        'name': 'Podcast No. - 161',
        'image': 'assets/songs/trs/images/trs-161.jpg'
      },
      {'name': 'Podcast No. - 167', 'image': 'assets/songs/trs/images/trs-167.jpg'},
      {
        'name': 'Podcast No. - 266',
        'image': 'assets/songs/trs/images/trs-266.jpg'
      },
    ],
    'Imagine Dragons': [
      {
        'name': 'Believer',
        'image': 'assets/songs/imagineDragons/images/believer.jpg'
      },
      {
        'name': 'Bones',
        'image': 'assets/songs/imagineDragons/images/bones.jpg'
      },
      {
        'name': 'Thunder',
        'image': 'assets/songs/imagineDragons/images/thunder.jpg'
      },
      {
        'name': 'Enemy',
        'image': 'assets/songs/imagineDragons/images/enemy.jpg'
      },
      {
        'name': 'Demons',
        'image': 'assets/songs/imagineDragons/images/demons.jpg'
      },
    ],
  };
}
