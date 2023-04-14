import 'package:flutter/material.dart';
import 'package:paperbound/index.dart';

import '../../provider/LoginProvider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/image.png',
                width: 300.0,
                height: 300.0,
                fit: BoxFit.cover,
              ),
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
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register1Widget(),
                    ),
                  );
                },
                child: Text(
                  'No tienes cuenta?',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              FFButtonWidget(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  if (await _loginProvider.login(email, password) == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesWidget(),
                      ),
                    );
                  }
                },
                text: 'Iniciar sesión',
                options: FFButtonOptions(
                  width: 300.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFB4FFA8),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
