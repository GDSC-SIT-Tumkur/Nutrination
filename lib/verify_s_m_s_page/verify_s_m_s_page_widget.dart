import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_s_m_s_page_model.dart';
export 'verify_s_m_s_page_model.dart';

class VerifySMSPageWidget extends StatefulWidget {
  const VerifySMSPageWidget({Key? key}) : super(key: key);

  @override
  _VerifySMSPageWidgetState createState() => _VerifySMSPageWidgetState();
}

class _VerifySMSPageWidgetState extends State<VerifySMSPageWidget> {
  late VerifySMSPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifySMSPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Enter Pin Code Below',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Outfit',
                color: Color(0xFF101213),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Confirm your Code',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(44.0, 8.0, 44.0, 0.0),
                    child: Text(
                      'This code helps keep your account safe and secure.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF4B39EF),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: Color(0xFF4B39EF),
                      obscureText: false,
                      hintCharacter: '-',
                      pinTheme: PinTheme(
                        fieldHeight: 60.0,
                        fieldWidth: 60.0,
                        borderWidth: 2.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: PinCodeFieldShape.box,
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        selectedColor: Color(0xFF57636C),
                        activeFillColor: Color(0xFF4B39EF),
                        inactiveFillColor: Color(0xFFF1F4F8),
                        selectedFillColor: Color(0xFF57636C),
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) => {},
                      onCompleted: (_) async {
                        GoRouter.of(context).prepareAuthEvent();
                        final smsCodeVal = _model.pinCodeController!.text;
                        if (smsCodeVal == null || smsCodeVal.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enter SMS verification code.'),
                            ),
                          );
                          return;
                        }
                        final phoneVerifiedUser = await verifySmsCode(
                          context: context,
                          smsCode: smsCodeVal,
                        );
                        if (phoneVerifiedUser == null) {
                          return;
                        }

                        context.goNamedAuth('LoginPage', mounted);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('HomePage');
                },
                text: 'Confirm & Continue',
                options: FFButtonOptions(
                  width: 270.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF101213),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFF1F4F8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
