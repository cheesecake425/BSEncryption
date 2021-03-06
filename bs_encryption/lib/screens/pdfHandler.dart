import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pdfHandler extends StatefulWidget {
  String path = 'assets/sample.pdf';
  pdfHandler(String path){
    this.path = path;
  }
  pdfShower createState() => pdfShower(path);
}

class pdfShower extends State<pdfHandler> {
  pdfShower(String path){
    this.path = path;
  }
  PDFDocument document;
  bool _isLoading = true;
  String path;
  @override
  void initState(){
    super.initState();
    docSelect();
  }
  Future<void> docSelect() async {
    document = await PDFDocument.fromAsset(path);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Estatemenet")),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: document, zoomSteps: 5,),
        ),
      ),
    );
  }
}
