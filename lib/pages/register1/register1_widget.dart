import '../../provider/LoginProvider.dart';
import '../categories/categories_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../login/login_widget.dart';
import 'register1_model.dart';
export 'register1_model.dart';

class Register1Widget extends StatefulWidget {
  const Register1Widget({Key? key}) : super(key: key);

  @override
  _Register1WidgetState createState() => _Register1WidgetState();
}

class _Register1WidgetState extends State<Register1Widget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatpasswordController = TextEditingController();
  LoginProvider _loginProvider = LoginProvider();

  final textFormFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.green, width: 2.0),
    ),
  );

  final textFormFieldTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/image.png',
                      width: 300.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 21.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailController,
                      style: textFormFieldTextStyle,
                      decoration: textFormFieldStyle.copyWith(
                          hintText: 'Ingrese su usuario aquí'),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      style: textFormFieldTextStyle,
                      decoration: textFormFieldStyle.copyWith(
                          hintText: 'Ingrese su contraseña aquí'),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _repeatpasswordController,
                      style: textFormFieldTextStyle,
                      decoration: textFormFieldStyle.copyWith(
                          hintText: 'Repita la contraseña'),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    FFButtonWidget(
                      onPressed: () async {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String repeatedPsswd = _repeatpasswordController.text;
                        if (await _loginProvider.register(
                                email, password, repeatedPsswd) ==
                            true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      },
                      text: 'Registrarse',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFB4FFA8),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF0F1113),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
