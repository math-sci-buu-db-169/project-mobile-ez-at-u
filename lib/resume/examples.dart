import 'dart:async';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'data.dart';
import 'examples/resume.dart';

const examples = <Example>[
  Example('RESUME', 'resume.dart', generateResume),
  // Example('DOCUMENT', 'document.dart', generateDocument),
  // Example('INVOICE', 'invoice.dart', generateInvoice),
  // Example('REPORT', 'report.dart', generateReport),
  // Example('CALENDAR', 'calendar.dart', generateCalendar),
  // Example('CERTIFICATE', 'certificate.dart', generateCertificate, true),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data,
    PdfColor colorOfPdfUsTheme,
    PdfColor colorOfPdfUsButtonTitle,
    PdfColor colorOfPdfUsName,
    PdfColor colorOfPdfUsPosition,
    PdfColor colorOfPdfUsExperience,
    PdfColor colorOfPdfUsEducations,
    PdfColor colorOfPdfUsContact,
    PdfColor colorOfPdfUsCertifications,
    PdfColor colorOfPdfUsSkills,
    PdfColor colorOfPdfUsAbout,
    PdfColor colorOfPdfUsText);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}
