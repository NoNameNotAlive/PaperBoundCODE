import 'package:paperbound/provider/GenreProvider.dart';
import 'package:paperbound/widgets/genre_card.dart';

import '../../models/genre.dart';
import '../filtrado_libros_categorias/filtrado_libros_categorias_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../user_config/user_config_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late CategoriesModel _model;

  final GenreProvider genreProvider = new GenreProvider();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Genre>>(
      future: genreProvider.getAllGenres(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final genres = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF1F4F8),
            appBar: AppBar(
              backgroundColor: Color(0xFFB4FFA8),
              automaticallyImplyLeading: false,
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserConfigWidget(),
                      ),
                    );
                  },
                ),
              ],
              centerTitle: true,
              toolbarHeight: 100.0,
              elevation: 4.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Text(
                          'Encuentra tu siguiente historia.',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).black600,
                                fontSize: 25.0,
                              ),
                        ),
                      ),
                      genres == null
                          ? Center(
                              child: Text('No hay géneros disponibles'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: genres.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GenreCard(genre: genres[index]);
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: SizedBox(
            width: 48.0,
            height: 48.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
        );
      },
    );
  }
}
