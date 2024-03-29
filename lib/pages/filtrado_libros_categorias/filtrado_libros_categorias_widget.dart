import '../cart_view/cart_view_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../item_page/item_page_widget.dart';
import '../../provider/BookProvider.dart';
import '../../models/book.dart';
import '../../widgets/file_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtrado_libros_categorias_model.dart';
export 'filtrado_libros_categorias_model.dart';

class FiltradoLibrosCategoriasWidget extends StatefulWidget {
  final String genre;
  const FiltradoLibrosCategoriasWidget({Key? key, required this.genre})
      : super(key: key);

  @override
  _FiltradoLibrosCategoriasWidgetState createState() =>
      _FiltradoLibrosCategoriasWidgetState();
}

class _FiltradoLibrosCategoriasWidgetState
    extends State<FiltradoLibrosCategoriasWidget> {
  late FiltradoLibrosCategoriasModel _model;

  final BookProvider bookProvider = new BookProvider();
  late List<Book> bookList = [];
  TextEditingController _controller = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltradoLibrosCategoriasModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: bookProvider.getBooksByGenre(
          widget.genre, _model.textController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Book>? books = snapshot.data;
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFFB4FFA8),
              automaticallyImplyLeading: true,
              title: TextFormField(
                controller: _model.textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Buscar Libro...',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color(0x9EE0E3E7),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                onChanged: (value) async => {
                  books =
                      await bookProvider.getBooksByGenre(widget.genre, value),
                  setState(() {})
                },
                validator: _model.textControllerValidator.asValidator(context),
              ),
              centerTitle: true,
              toolbarHeight: 100.0,
              elevation: 4.0,
            ),
            body: Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.filter_alt,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            'Filtrado por: ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                          ),
                        ),
                        Text(
                          widget.genre,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true, // Agrega esta propiedad
                      children: [
                        books == null
                            ? Center(
                                child: Text('No hay libros disponibles'),
                              )
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: books?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return BookCard(book: books![index]);
                                },
                              ),
                      ],
                    ),
                  )
                ],
              ),
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
