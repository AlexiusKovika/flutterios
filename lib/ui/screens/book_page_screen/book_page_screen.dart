import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/book_page_screen/widgets/pdf_tron_viewer.dart';

class BookPageScreen extends StatelessWidget {
  final String pdfPath;
  const BookPageScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    print(pdfPath);
    return Scaffold(
      backgroundColor: AppElementColors.backgroundGrey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          width: MediaQuery.of(context).size.width,
          child: PdfTronViewer(
            pdfPath: pdfPath,
          ),
        ),
      ),
    );
  }
}



// Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const TopLogoPart(),
//               Expanded(
//                 child: PdfPage(
//                   pdfPath: pdfPath,
//                 ),
//               ),
//             ],
//           ),