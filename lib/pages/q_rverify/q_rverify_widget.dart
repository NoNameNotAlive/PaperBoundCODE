import 'package:paperbound/provider/QRProvider.dart';

import '../categories/categories_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../user_config/user_config_widget.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_rverify_model.dart';
export 'q_rverify_model.dart';

class QRverifyWidget extends StatefulWidget {
  final int idBook;
  final int idMap;
  const QRverifyWidget({Key? key, required this.idBook, required this.idMap})
      : super(key: key);

  @override
  _QRverifyWidgetState createState() => _QRverifyWidgetState();
}

class _QRverifyWidgetState extends State<QRverifyWidget> {
  late QRverifyModel _model;

  String? _qr;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    getQr();
    _model = createModel(context, () => QRverifyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> getQr() async {
    QrProvider qrProvider = new QrProvider();
    String qr = await qrProvider.createQr(widget.idBook, widget.idMap);

    setState(() {
      _qr = qr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CategoriesWidget()),
          );
          return true;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          appBar: AppBar(
            backgroundColor: Color(0xFFF1F4F8),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: FaIcon(
                FontAwesomeIcons.chevronCircleLeft,
                color: Color(0xFFB4FFA8),
                size: 30.0,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesWidget(),
                  ),
                );
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: _qr == null
              ? Center(
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                )
              : SafeArea(
                  child: GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(_unfocusNode),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '¡Gracias por la reserva!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Aquí tienes tu codigo QR:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFC7CED3),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 60.0, 30.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFB4FFA8),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: BarcodeWidget(
                                    data: _qr!,
                                    barcode: Barcode.qrCode(),
                                    width: 100.0,
                                    height: 100.0,
                                    color: Colors.black,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                    errorBuilder: (_context, _error) =>
                                        SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                    drawText: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
