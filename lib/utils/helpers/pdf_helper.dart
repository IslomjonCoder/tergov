import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:tergov/features/dashboard/data/models/participant_model.dart';

class PdfHelper {
  PdfHelper._();

  static Future<File> generatePdf( Participant participant) async {
    final pdf = pw.Document();
    final fontMedium = await rootBundle.load('assets/fonts/Roboto/Roboto-Medium.ttf');
    final fontRegular = await rootBundle.load('assets/fonts/Roboto/Roboto-Regular.ttf');
    final ttfMedium = pw.Font.ttf(fontMedium);
    final ttfRegular = pw.Font.ttf(fontRegular);
    final img = await rootBundle.load('assets/images/images-Photoroom.png');
    final imageBytes = img.buffer.asUint8List();
    final pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes), height: 60, width: 60, fit: pw.BoxFit.scaleDown);
    pdf..addPage(
      pw.Page(
        margin: const pw.EdgeInsets.only(left: 30, right: 15, top: 20, bottom: 20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '1. Суҳбат ўтказилган процесс иштирокчиси: ФИШ ${participant.participantFullName}',
                subtitle: 'Участник(ца) процесса, прошедший(ая) беседу: ФИО',
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '2. Яшаш манзили ${participant.placeOfResidence}',
                subtitle: 'Место проживания',
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '3. Телефон рақами ${participant.phoneNumber}',
                subtitle: 'Номер телефона',
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  PdfContentWidget(
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                    title: '4. Процесс иштирокчисининг мақоми:',
                    subtitle: 'Номер телефона',
                  ),
                  pw.SizedBox(width: 10),
                  RichTextContentWidget(
                    mainText: participant.participantRole.translations.isEmpty ? participant.participantRole.roleName : participant.participantRole.translations.first.uzbekTranslation,
                    subText: '/ ${participant.participantRole.translations.isEmpty ? participant.participantRole.roleName : participant.participantRole.translations.first.russianTranslation}',
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                  ),
                ],
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  PdfContentWidget(
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                    title: '5. Суҳбат ўтказилди:',
                    subtitle: 'Беседа проведена:',
                  ),
                  pw.SizedBox(width: 10),
                  RichTextContentWidget(
                    mainText: 'Терговга қадар текширув материали бўйича ',
                    subText: '/ по материалу доследственной проверки',
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                  ),
                ],
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '6. Суҳбат ўтказилган сана: ${DateFormat('dd.MM.yyyy').format(participant.interviewStartDate)}',
                subtitle: 'Дата беседы:',
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  PdfContentWidget(
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                    title: '7. Суҳбат ўтказган тергов бўлинмаси раҳбари: ФИШ/имзо',
                    subtitle: 'Начальник следственного отделения, проводивший беседу: ФИО/ подпись',
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(
                    participant.officerFullName,
                    style: pw.TextStyle(fontSize: 10, font: ttfMedium),
                  ),
                  pw.SizedBox(width: 10),
                  image1,
                ],
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '8. Терговга қадар текширув, суриштирув ёки тергов ўтказган ходим: ФИШ ${participant.officerFullName}',
                subtitle: 'Сотрудник, проводивший доследственную проверку, дознание или расследование: ФИО',
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: '9. Суҳбат давомида Ўзбекистон Республикаси Жиноят кодексининг 211-моддаси мазмуни тушунтирилди: ',
                subtitle: 'В ходе беседы разъяснено содержание статьи 211 Уголовного кодекса Республики Узбекистан:',
              ),
              pw.SizedBox(height: 16),
              pw.RichText(
                textAlign: pw.TextAlign.justify,
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                      text:
                          'Пора бериш, яъни давлат органи, давлат иштирокидаги ташкилот ёки фуқароларнинг ўзини ўзи бошқариш органи мансабдор шахсига мазкур мансабдор шахснинг ўз хизмат мавқеидан фойдаланган ҳолда содир этиши лозим ёки мумкин бўлган муайян ҳаракатни пора берган шахснинг манфаатларини кўзлаб бажариши ёки бажармаслиги эвазига қонунга хилоф эканлигини била туриб бевосита ёки воситачи орқали моддий қимматликлар бериш ёки уни мулкий манфаатдор этганлик учун ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'беш йилдан ўн беш йилгача озодликдан маҳрум қилиш ',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'билан жазоланиши мумкинлиги ҳақида ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'огоҳлантирилдим.',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.RichText(
                textAlign: pw.TextAlign.justify,
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                      text:
                          'Мне разъяснено о том, что дача взятки, то есть заведомо незаконное предоставление должностному лицу государственного органа, организации с государственным участием или органа самоуправления граждан лично или через посредника материальных ценностей или имущественной выгоды за выполнение или невыполнение в интересах давшего взятку определенного действия, которое должностное лицо должно было или могло совершить с использованием своего служебного положения, предусматривает уголовное наказание в виде ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'лишения свободы от пяти до пятнадцати лет.',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                image1,
                pw.SizedBox(width: 16),
                pw.Text(participant.officerFullName, style: pw.TextStyle(font: ttfMedium, fontSize: 10)),
              ],),
              pw.SizedBox(height: 16),
              pw.Row(
                children: [
                  PdfContentWidget(
                    ttfMedium: ttfMedium,
                    ttfRegular: ttfRegular,
                    title: '10. Суҳбат жараёни видеоёзув орқали: ',
                    subtitle: 'Процесс собеседования видеозаписью: ',
                  ),
                  if (participant.interviewRecorded) pw.SizedBox(width: 16),
                  if (participant.interviewRecorded)
                    PdfContentWidget(
                      ttfMedium: ttfMedium,
                      ttfRegular: ttfRegular,
                      title: 'Қайд қилинди',
                      subtitle: 'Зафикцирован',
                    ),
                  if (!participant.interviewRecorded) pw.SizedBox(width: 16),
                  if (!participant.interviewRecorded)
                    PdfContentWidget(
                      ttfMedium: ttfMedium,
                      ttfRegular: ttfRegular,
                      title: 'Қайд қилинмади',
                      subtitle: 'Не зафикцирован',
                    ),
                ],
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: 'Ходим томонидан қуйидаги ҳолатларга йўл қўйилдими?  ',
                subtitle: 'Имели ли место со стороны сотрудника следующие факты?',
              ),
              pw.SizedBox(height: 16),
              RichTextContentWidget(
                mainText: 'Сабабсиз куттириш',
                subText: ' / длительные беспричинные ожидания',
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
              ),
              pw.SizedBox(height: 16),
              RichTextContentWidget(
                mainText: 'Қўполлик қилиш',
                subText: ' / грубое обращение',
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
              ),
              pw.SizedBox(height: 16),
              RichTextContentWidget(
                mainText: 'Руҳий тазйиқ ўтказиш',
                subText: ' / психологическое давление',
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
              ),
              pw.SizedBox(height: 16),
              RichTextContentWidget(
                mainText: 'Жисмоний тазйиқ ўтказиш',
                subText: ' / физическое давление',
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
              ),
            ],
          );
        },
      ),
    )
    ..addPage(
      pw.Page(
        margin: const pw.EdgeInsets.only(left: 30, right: 15, top: 20, bottom: 20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              RichTextContentWidget(
                mainText: 'Тамагирлик ёки моддий манфаат талаб қилиш',
                subText: ' / вымогательство незаконного вознаграждения',
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
              ),
              pw.SizedBox(height: 16),
              PdfContentWidget(
                ttfMedium: ttfMedium,
                ttfRegular: ttfRegular,
                title: 'Бошқа ҳолат ',
                subtitle: 'Другие факты ',
              ),
              pw.SizedBox(height: 16),
              pw.Text(
                'Д И Қ Қ А Т !',
                style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 16),
              pw.RichText(
                textAlign: pw.TextAlign.justify,
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                      text:
                          'Ички ишлар органлари тергов бўлинмалари томонидан ўтказилаётган терговга қадар текширув, суриштирув ёки дастлабки тергов ҳаракатларидан, шунингдек мурожаатларингиз ўз вақтида қонуний ҳал қилинмаётганлигидан норози бўлсангиз, тўғридан-тўғри Наманган вилояти ИИБ ҳузуридаги Тергов бошқармаси ва унинг ҳудудий бўлинмалари раҳбарларининг қуйидаги ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'телефон рақамларига ',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'мурожаат қилишингиз мумкин:',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.RichText(
                text: pw.TextSpan(
                  text: '1. ',
                  children: [
                    pw.TextSpan(
                      text: 'Наманган вилояти ИИБ бошлиғи ўринбосари – Тергов бошқармаси бошлиғи ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'Ибодов Жаҳонгир Насулло ўғли:',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '998 95-318-04-00, 998 69-210-30-04',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '2. ',
                  children: [
                    pw.TextSpan(
                      text: 'Наманган вилояти ИИБ ҳузуридаги Тергов бошқармаси бошлиғининг ўринбосари  ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '3. ',
                  children: [
                    pw.TextSpan(
                      text: 'Наманган вилояти ИИБ ҳузуридаги Тергов бошқармаси бошлиғининг ўринбосари  ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '4. ',
                  children: [
                    pw.TextSpan(
                      text: '______________ шаҳар (туман) ИИО ФМБ (ИИБ) тергов бўлими (бўлинма, гуруҳ) раҳбари',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Text(
                'В Н И М А Н И Е !',
                style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 16),
              pw.Text(
                'Если Вас не устраивают доследственная проверка, дознание или предварительное следствие проведенных следственными подразделениями органов внутренних дел, а также несвоевременное рассмотрение Ваших обращений, Вы можете напрямую связаться с руководителями Следственного управления при УВД Наманганской области и его территориальных подразделений по следующим телефонам: ',
                style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                textAlign: pw.TextAlign.justify,
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '1. ',
                  children: [
                    pw.TextSpan(
                      text: 'Заместитель начальника УВД Наманганской области – начальник Следственного управления ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                    pw.TextSpan(
                      text: 'Ибодов Жаҳонгир Насулло ўғли:',
                      style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '998 95-318-04-00, 998 69-210-30-04',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '2. ',
                  children: [
                    pw.TextSpan(
                      text: 'Заместитель начальника Следственного управления при УВД Наманганской области ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '3. ',
                  children: [
                    pw.TextSpan(
                      text: 'Заместитель начальника Следственного управления при УВД Наманганской области ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: '4. ',
                  children: [
                    pw.TextSpan(
                      text: 'Начальник следственного отдела (отделения, группы) города (района) ',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Тел: ',
                  style: pw.TextStyle(font: ttfMedium, fontSize: 10),
                  children: [
                    pw.TextSpan(
                      text: '',
                      style: pw.TextStyle(font: ttfRegular, fontSize: 10),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 16),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    PdfContentWidget(
                      ttfMedium: ttfMedium,
                      ttfRegular: ttfRegular,
                      title: 'Суҳбат ўтказган ходим:',
                      subtitle: 'Сотрудник проводивший беседу:',
                    ),
                    PdfContentWidget(
                      ttfMedium: ttfMedium,
                      ttfRegular: ttfRegular,
                      title: 'Суҳбат ўтказилган сана: ${DateFormat('dd.MM.yyyy').format(DateTime.now())} йил/год',
                      subtitle: 'Дата беседы',
                    ),
                    PdfContentWidget(
                      ttfMedium: ttfMedium,
                      ttfRegular: ttfRegular,
                      title: 'Суҳбат ўтказилган процесс иштирокчиси:',
                      subtitle: 'Участник(ца) процесса, прошедший(ая) беседу',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    final fileDirectory = await getApplicationDocumentsDirectory();
    final filePath =
        '${fileDirectory.path}/${participant.participantFullName}_${participant.interviewStartDate.toIso8601String()}.pdf';
    final bytes = await pdf.save();
    final pdfFile = await File(filePath).writeAsBytes(bytes);
    return pdfFile;
  }
}

class PdfContentWidget extends pw.StatelessWidget {
  final pw.Font ttfMedium;
  final pw.Font ttfRegular;
  final String title;
  final String subtitle;

  PdfContentWidget({
    required this.ttfMedium,
    required this.ttfRegular,
    required this.title,
    required this.subtitle,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(font: ttfMedium, fontSize: 10),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          subtitle,
          style: pw.TextStyle(font: ttfRegular, fontSize: 9, fontWeight: pw.FontWeight.normal),
        ),
      ],
    );
  }
}

class RichTextContentWidget extends pw.StatelessWidget {
  final String mainText;
  final String subText;
  final pw.Font ttfMedium;
  final pw.Font ttfRegular;

  RichTextContentWidget({
    required this.mainText,
    required this.subText,
    required this.ttfMedium,
    required this.ttfRegular,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.RichText(
      text: pw.TextSpan(
        text: mainText,
        style: pw.TextStyle(font: ttfMedium, fontSize: 10),
        children: [
          pw.TextSpan(
            text: subText,
            style: pw.TextStyle(font: ttfRegular, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
