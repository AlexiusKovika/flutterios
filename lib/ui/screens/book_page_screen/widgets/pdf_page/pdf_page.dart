import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/book_page_screen/widgets/pdf_tron_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatefulWidget {
  final String pdfPath;
  const PdfPage({super.key, required this.pdfPath});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? PdfTronViewer(pdfPath: widget.pdfPath)
        : SfPdfViewer.network(
            widget.pdfPath,
            enableTextSelection: false,
            currentSearchTextHighlightColor: AppElementColors.textBlue,
          );
  }
}
