import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paperbound/index.dart';
import '../models/genre.dart';
import '../pages/flutter_flow/flutter_flow_icon_button.dart';
import '../pages/flutter_flow/flutter_flow_theme.dart';
import '../pages/flutter_flow/flutter_flow_util.dart';
import '../pages/item_page/item_page_widget.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  GenreCard({required this.genre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FiltradoLibrosCategoriasWidget(
              genre: genre.name,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage(genre.img),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: Text(
                      genre.name,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
