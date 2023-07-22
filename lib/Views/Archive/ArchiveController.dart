import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../Base/BasePageController.dart';
import 'Api/ArchiveService.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
  RxList<Map<String, dynamic>> items=<Map<String, dynamic>>[].obs;
  RxString money = "0".obs;
  RxDouble totalFullMoney=0.0.obs;
  var PDF_Path;
  var Header;

  CheckPermision() async {
    await Permission.storage.request().isGranted;
    var status = await Permission.storage.status;

    if (status.isGranted) {
      final directory = await getApplicationSupportDirectory();
      PDF_Path = '${directory.path}' ;

      print(PDF_Path);

      Create_Pdf_Daily();
    }
  }

  Create_Pdf_Daily() async {
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 7);
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.cells[0].value = 'نیرو';
    headerRow.cells[1].value = 'B';
    headerRow.cells[2].value = 'C';
    headerRow.cells[3].value = 'D';
    headerRow.cells[4].value = 'E';
    headerRow.cells[5].value = 'F';
    headerRow.cells[6].value = 'G';

    final data = await rootBundle.load('fonts/arial.ttf');

    headerRow.style.font = PdfTrueTypeFont(data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes), 10, style: PdfFontStyle.bold);

    final PdfPageTemplateElement headerTemplate =
    PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
    headerTemplate.graphics.drawString('Traffic Lits For '+Header.toString(), PdfStandardFont(PdfFontFamily.helvetica, 12), bounds: const Rect.fromLTWH(0, 15, 200, 20));
    document.template.top = headerTemplate;

    double t1=0.0,t2=0.0,t3=0.0,t4=0.0;

    /*for(int i=0;i<result.data.tx.length;i++) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = year+"/"+month+"/"+(i+1).toString();

      row.cells[1].value = double.parse((await getGigs(result.data.rx[i].toString())).toStringAsFixed(2)).toString()+" GB";
      t1=t1+double.parse((await getGigs(result.data.rx[i].toString())).toStringAsFixed(2));

      row.cells[2].value = double.parse((await getGigs(result.data.tx[i].toString())).toStringAsFixed(2)).toString()+" GB";
      t2=t2+double.parse((await getGigs(result.data.tx[i].toString())).toStringAsFixed(2));

      row.cells[3].value = double.parse((await getGigs(result.data.total[i].toString())).toStringAsFixed(2)).toString()+" GB";
      t3=t3+double.parse((await getGigs(result.data.total[i].toString())).toStringAsFixed(2));

      row.cells[4].value = double.parse((await getGigs(result.data.totalReal[i].toString())).toStringAsFixed(2)).toString()+" GB";
      t4=t4+double.parse((await getGigs(result.data.totalReal[i].toString())).toStringAsFixed(2));

      grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
      grid.draw(page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height));
    }*/

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = ("اولیه").toString();
    row.cells[0].style=PdfGridCellStyle(
        font: PdfTrueTypeFont(data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes), 10, style: PdfFontStyle.bold)
    );
    row.cells[1].value = t1.toStringAsFixed(2).toString()+" GB";
    row.cells[2].value = t2.toStringAsFixed(2).toString()+" GB";
    row.cells[3].value = t3.toStringAsFixed(2).toString()+" GB";
    row.cells[4].value = t4.toStringAsFixed(2).toString()+" GB";
    row.cells[5].value = t3.toStringAsFixed(2).toString()+" GB";
    row.cells[6].value = t4.toStringAsFixed(2).toString()+" GB";
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
    grid.draw(page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height));

    String RealPath = PDF_Path.toString()+"/"+DateTime.now().millisecondsSinceEpoch.toString()+".pdf";
    await File(RealPath).writeAsBytes(await document.save());
    await OpenFile.open(RealPath);
    document.dispose();

  }

  void getDetailsList() async {
    getCurrentMoney();

    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_details");

    if(getRowCount>0){
      items.value = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_details");
    }

    getTotalFullMoney();

  }

  getCurrentMoney() async {
    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_money");

    if (getRowCount > 0) {
      final allRows = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_money");
      for (final row in allRows) {
        money.value = row["money"].toString();
      }
      money.value=(int.parse(money.value)/60).toString();
    }
  }

  String getTotalSalary(String time1, String time2) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());

    DateTime a = DateTime.parse('$_date $time1');
    DateTime b = DateTime.parse('$_date $time2');

    if(a.difference(b).inMinutes > 0){
      return (a.difference(b).inMinutes*double.parse(money.value)).toStringAsFixed(0).seRagham();
    }else{
      return "0";
    }

  }

  getTotalFullMoney() {
    totalFullMoney.value=0.0;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());
    for(int i=0;i<items.length;i++){

      String time1=items[i]["out_time"].toString();
      String time2=items[i]["imp_time"].toString();

      DateTime a = DateTime.parse('$_date $time1');
      DateTime b = DateTime.parse('$_date $time2');

      if(a.difference(b).inMinutes > 0){
        totalFullMoney.value=totalFullMoney.value+a.difference(b).inMinutes*double.parse(money.value);
      }
    }
  }

  String getHours(String time1, String time2) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());

    print(time1);
    print(time2);

    DateTime a = DateTime.parse('$_date $time1');
    DateTime b = DateTime.parse('$_date $time2');

    if(a.difference(b).inMinutes > 0){
      return getTimeString(a.difference(b).inMinutes);
    }else{
      return "0";
    }

  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

}