import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import '../../../screen_independent_widgets/logos_with_margin.dart';
// Uncomment this if you are using local files
// import 'package:permission_handler/permission_handler.dart';

class PdfTronViewer extends StatefulWidget {
  final String pdfPath;
  @override
  _PdfTronViewerState createState() => _PdfTronViewerState();

  PdfTronViewer({required this.pdfPath});
}

class _PdfTronViewerState extends State<PdfTronViewer> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    // showViewer();

    // If you are using local files delete the line above, change the _document field
    // appropriately and uncomment the section below.
    // if (Platform.isIOS) {
    // // Open the document for iOS, no need for permission.
    // showViewer();
    // } else {
    // // Request permission for Android before opening document.
    // launchWithPermission();
    // }
  }

  // Future<void> launchWithPermission() async {
  //  PermissionStatus permission = await Permission.storage.request();
  //  if (permission.isGranted) {
  //    showViewer();
  //  }
  // }

  // Platform messages are asynchronous, so initialize in an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so use a try/catch PlatformException.
    try {
      // Initializes the PDFTron SDK, it must be called before you can use any functionality.
      PdftronFlutter.initialize(
          "4C0A3019E746A0235892B62F4E6F3FA7C3F5B2A56C05133AD750A02A8AB6F5C7");

      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, you want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  void showViewer() async {
    var config = Config();

    var documentLoadedCancel = startDocumentLoadedListener((filePath) {
      print("document loaded: $filePath");
    });

    await PdftronFlutter.openDocument(widget.pdfPath, config: config);

    try {
      // The imported command is in XFDF format and tells whether to add, modify or delete annotations in the current document.
      PdftronFlutter.importAnnotationCommand(
          "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
              "    <xfdf xmlns=\"http://ns.adobe.com/xfdf/\" xml:space=\"preserve\">\n" +
              "      <add>\n" +
              "        <square style=\"solid\" width=\"5\" color=\"#E44234\" opacity=\"1\" creationdate=\"D:20200619203211Z\" flags=\"print\" date=\"D:20200619203211Z\" name=\"c684da06-12d2-4ccd-9361-0a1bf2e089e3\" page=\"1\" rect=\"113.312,277.056,235.43,350.173\" title=\"\" />\n" +
              "      </add>\n" +
              "      <modify />\n" +
              "      <delete />\n" +
              "      <pdf-info import-version=\"3\" version=\"2\" xmlns=\"http://www.pdftron.com/pdfinfo\" />\n" +
              "    </xfdf>");
    } on PlatformException catch (e) {
      print("Failed to importAnnotationCommand '${e.message}'.");
    }

    try {
      // Adds a bookmark into the document.
      PdftronFlutter.importBookmarkJson('{"0":"Page 1"}');
    } on PlatformException catch (e) {
      print("Failed to importBookmarkJson '${e.message}'.");
    }

    // An event listener for when local annotation changes are committed to the document.
    // xfdfCommand is the XFDF Command of the annotation that was last changed.
    var annotCancel = startExportAnnotationCommandListener((xfdfCommand) {
      String command = xfdfCommand;
      print("flutter xfdfCommand:\n");
      // Dart limits how many characters are printed onto the console.
      // The code below ensures that all of the XFDF command is printed.
      if (command.length > 1024) {
        int start = 0;
        int end = 1023;
        while (end < command.length) {
          print(command.substring(start, end) + "\n");
          start += 1024;
          end += 1024;
        }
        print(command.substring(start));
      } else {
        print("flutter xfdfCommand:\n $command");
      }
    });

    startExportBookmarkListener((bookmarkJson) {
      print("flutter bookmark: $bookmarkJson");
    });

    var path = await PdftronFlutter.saveDocument();
    print("flutter save: $path");

    // To cancel event:
    // annotCancel();
    // bookmarkCancel();
    documentLoadedCancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            LogoWidgetWithMargin(),
            Expanded(
              child: DocumentView(
                onCreated: _onDocumentViewCreated,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDocumentViewCreated(DocumentViewController controller) async {
    Config config = Config();
    config.autoSaveEnabled = false;

    startLeadingNavButtonPressedListener(() {
      Navigator.of(context).pop();
    });

    controller.openDocument(widget.pdfPath, config: config);
  }
}
