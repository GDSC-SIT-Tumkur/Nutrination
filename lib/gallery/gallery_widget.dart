import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gallery_model.dart';
export 'gallery_model.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget>
    with TickerProviderStateMixin {
  late GalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GalleryModel());
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
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Gallary',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Color(0xFF14181B),
                fontSize: 28.0,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 44.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x1F000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                child: Image.network(
                                  'data:image/jpeg;base64,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',
                                  width: double.infinity,
                                  height: 240.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  child: Image.network(
                                    'data:image/jpeg;base64,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',
                                    width: double.infinity,
                                    height: 240.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x1F000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x1F000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
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
      ),
    );
  }
}
