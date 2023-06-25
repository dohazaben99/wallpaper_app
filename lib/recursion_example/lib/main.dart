import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_eyesight/recursion_example/lib/MenueItemModel.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    TestGetRecursive.getMenues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<List<MenueItemModel>>(
                  future: TestGetRecursive.getMenues(),
                  builder: (ctx, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  Text(
                                      "parent ${snapshot.data![index].caption}"),
                                  const Divider(),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                          .data![index].children!.length,
                                      itemBuilder: (ctx, ind) {
                                        return TestGetRecursive.recursePls(
                                            snapshot
                                                .data![index].children![ind]);
                                      })
                                ],
                              );
                            })
                        : CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TestGetRecursive {
  // List<MenuItem>  TestMenu(){
  static String jsonData = ''' 
    [
{
"id": 1,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 7,
"parent": 0,
"caption": "ملف",
"ecaption": "File",
"children": [
{
"id": 9,
"fn_id": 1,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 1,
"caption": "إعدادات",
"ecaption": "Settings",
"children": [
{
"id": 223,
"fn_id": 222,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 9,
"caption": "ZQZQ Many",
"ecaption": "ZQZQ Many",
"children": [
{
"id": 224,
"fn_id": 222,
"enabled": "Y",
"visible": "Y",
"ord": 999,
"parent": 223,
"caption": "ZQZQ Many2",
"ecaption": "ZQZQ Many2",
"children": [
{
"id": 226,
"fn_id": 222,
"enabled": "Y",
"visible": "Y",
"ord": 999,
"parent": 224,
"caption": "ZQZQ Many3",
"ecaption": "ZQZQ Many3 ",
"children": [],
"function_name": {
"fn_id": 222,
"fn": "rfAccGenRep10",
"fn_type": "RF",
"dsc": "تقارير تحليلية مخصصة ",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 222,
"fn": "rfAccGenRep10",
"fn_type": "RF",
"dsc": "تقارير تحليلية مخصصة ",
"trial576": "T"
}
},
{
"id": 225,
"fn_id": 222,
"enabled": "Y",
"visible": "Y",
"ord": 999, 
"parent": 223,
"caption": "ZQZQ Many7",
"ecaption": "ZQZQ Many7 ",
"children": [],
"function_name": {
"fn_id": 222,
"fn": "rfAccGenRep10",
"fn_type": "RF",
"dsc": "تقارير تحليلية مخصصة ",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 222,
"fn": "rfAccGenRep10",
"fn_type": "RF",
"dsc": "تقارير تحليلية مخصصة ",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 1,
"fn": "sSettings",
"fn_type": "SF",
"dsc": "إعدادات",
"trial576": "T"
}
},
{
"id": 10,
"fn_id": 2,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 1,
"caption": "صلاحيات المستخدمين",
"ecaption": "Users Privileges ",
"children": [],
"function_name": {
"fn_id": 2,
"fn": "sRoles",
"fn_type": "SF",
"dsc": "صلاحيات المستخدمين",
"trial576": "T"
}
},
{
"id": 11,
"fn_id": 3,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 1,
"caption": "المستخدمين",
"ecaption": "Users",
"children": [],
"function_name": {
"fn_id": 3,
"fn": "sUsers",
"fn_type": "SF",
"dsc": "المستخدمين",
"trial576": "T"
}
},
{
"id": 12,
"fn_id": 4,
"enabled": "Y",
"visible": "Y",
"ord": 4,
"parent": 1,
"caption": "تغيير كلمة السر",
"ecaption": "Change Password",
"children": [],
"function_name": {
"fn_id": 4,
"fn": "sChanegPass",
"fn_type": "SF",
"dsc": "تغيير كلمة السر",
"trial576": "T"
}
},
{
"id": 13,
"fn_id": 5,
"enabled": "Y",
"visible": "Y",
"ord": 5,
"parent": 1,
"caption": "خروج",
"ecaption": "Exit",
"children": [],
"function_name": {
"fn_id": 5,
"fn": "sExit",
"fn_type": "F",
"dsc": "خروج",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 2,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 0,
"caption": "السجلات الرئيسية",
"ecaption": "Main Records",
"children": [],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 3,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 0,
"caption": "المدخلات",
"ecaption": "Entries",
"children": [],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 4,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 0,
"caption": "التدقيق",
"ecaption": "Audit",
"children": [
{
"id": 26,
"fn_id": 18,
"enabled": "Y",
"visible": "Y",
"ord": 69,
"parent": 4,
"caption": "كشف سندات اليومية -مختصر",
"ecaption": "Journal Voucher Sheet - Draft",
"children": [],
"function_name": {
"fn_id": 18,
"fn": "rfQVouchersList",
"fn_type": "RF",
"dsc": "كشف سندات اليومية -مختصر",
"trial576": "T"
}
},
{
"id": 27,
"fn_id": 19,
"enabled": "Y",
"visible": "Y",
"ord": 68,
"parent": 4,
"caption": "كشف سندات اليومية",
"ecaption": "Journal Voucher Sheet",
"children": [],
"function_name": {
"fn_id": 19,
"fn": "rfNonPostedVouchers",
"fn_type": "RF",
"dsc": "كشف سندات اليومية",
"trial576": "T"
}
},
{
"id": 29,
"fn_id": 21,
"enabled": "Y",
"visible": "Y",
"ord": 70,
"parent": 4,
"caption": "كشف سندات الشيكات",
"ecaption": "Cheques Receipts Sheet",
"children": [],
"function_name": {
"fn_id": 21,
"fn": "rfNonPostedCheques",
"fn_type": "RF",
"dsc": "كشف سندات الشيكات",
"trial576": "T"
}
},
{
"id": 31,
"fn_id": 23,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 4,
"caption": "كشف حساب قبل الترحيل",
"ecaption": "Statement Of Account Before Posting",
"children": [],
"function_name": {
"fn_id": 23,
"fn": "rfNonPostedAccountReports",
"fn_type": "RF",
"dsc": "كشف حساب قبل الترحيل",
"trial576": "T"
}
},
{
"id": 32,
"fn_id": 24,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 4,
"caption": "ميزان مراجعة قبل الترحيل",
"ecaption": "Trial Balance Before Posting",
"children": [],
"function_name": {
"fn_id": 24,
"fn": "rfNonPostedReviewBalance",
"fn_type": "RF",
"dsc": "ميزان مراجعة قبل الترحيل",
"trial576": "T"
}
},
{
"id": 52,
"fn_id": 44,
"enabled": "Y",
"visible": "Y",
"ord": 11,
"parent": 4,
"caption": "طباعة سندات القيد قبل الترحيل",
"ecaption": "Print Voucher Before Posting",
"children": [],
"function_name": {
"fn_id": 44,
"fn": "rfNonPostedDailyVchrs",
"fn_type": "RF",
"dsc": "طباعة سندات القيد قبل الترحيل",
"trial576": "T"
}
},
{
"id": 60,
"fn_id": 52,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 4,
"caption": "كشف حساب مجموعة حسابات",
"ecaption": "SOA For Groups Account",
"children": [],
"function_name": {
"fn_id": 52,
"fn": "rfNonPostedGrpAccRep",
"fn_type": "SF",
"dsc": "كشف حساب مجموعة حسابات",
"trial576": "T"
}
},
{
"id": 68,
"fn_id": 30,
"enabled": "Y",
"visible": "Y",
"ord": 12,
"parent": 4,
"caption": "طباعة سندات الصرف",
"ecaption": "Print",
"children": [],
"function_name": {
"fn_id": 30,
"fn": "rfPostedVouchers2",
"fn_type": "RF",
"dsc": "طباعة سندات الصرف",
"trial576": "T"
}
},
{
"id": 69,
"fn_id": 31,
"enabled": "Y",
"visible": "Y",
"ord": 13,
"parent": 4,
"caption": "طباعة سندات القبض",
"ecaption": "Print",
"children": [],
"function_name": {
"fn_id": 31,
"fn": "rfPostedVouchers1",
"fn_type": "RF",
"dsc": "طباعة سندات القبض",
"trial576": "T"
}
},
{
"id": 73,
"fn_id": 64,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 4,
"caption": "كشف أعمار الذمم-قبل الترحيل",
"ecaption": "كشف أعمار الذمم-قبل الترحيل",
"children": [],
"function_name": {
"fn_id": 64,
"fn": "rfUnPostedAgingRep",
"fn_type": "RF",
"dsc": "كشف أعمار الذمم-قبل الترحيل",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 5,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 4,
"parent": 0,
"caption": "الترحيل",
"ecaption": "Transfer",
"children": [
{
"id": 34,
"fn_id": 26,
"enabled": "Y",
"visible": "Y",
"ord": 9,
"parent": 5,
"caption": "ترحيل سندات اليومية",
"ecaption": "Post Journal Voucher",
"children": [],
"function_name": {
"fn_id": 26,
"fn": "sMoveTrans",
"fn_type": "RF",
"dsc": "ترحيل سندات اليومية",
"trial576": "T"
}
},
{
"id": 35,
"fn_id": 27,
"enabled": "Y",
"visible": "Y",
"ord": 10,
"parent": 5,
"caption": "ترحيل سندات  شيكات",
"ecaption": "Post Cheques Receipts",
"children": [],
"function_name": {
"fn_id": 27,
"fn": "sMoveCheques",
"fn_type": "RF",
"dsc": "ترحيل سندات  شيكات",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 6,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 5,
"parent": 0,
"caption": "الطباعة",
"ecaption": "Print",
"children": [
{
"id": 37,
"fn_id": 29,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 6,
"caption": "طباعة سندات القيد",
"ecaption": "Print Receipt Voucher",
"children": [],
"function_name": {
"fn_id": 29,
"fn": "rfPostedVouchers3",
"fn_type": "RF",
"dsc": "طباعة سندات القيد",
"trial576": "T"
}
},
{
"id": 38,
"fn_id": 30,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 6,
"caption": "طباعة سندات الصرف",
"ecaption": "Print Receive Receipts",
"children": [],
"function_name": {
"fn_id": 30,
"fn": "rfPostedVouchers2",
"fn_type": "RF",
"dsc": "طباعة سندات الصرف",
"trial576": "T"
}
},
{
"id": 39,
"fn_id": 31,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 6,
"caption": "طباعة سندات القبض",
"ecaption": "Print Payment Receipts",
"children": [],
"function_name": {
"fn_id": 31,
"fn": "rfPostedVouchers1",
"fn_type": "RF",
"dsc": "طباعة سندات القبض",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 7,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 6,
"parent": 0,
"caption": "التقارير",
"ecaption": "Reports",
"children": [
{
"id": 8,
"fn_id": 0,
"enabled": "Y",
"visible": "Y",
"ord": 0,
"parent": 7,
"caption": "المساعدة",
"ecaption": "Help",
"children": [
{
"id": 51,
"fn_id": 43,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 8,
"caption": "حول النظام",
"ecaption": "About System",
"children": [],
"function_name": {
"fn_id": 43,
"fn": "sAbout",
"fn_type": "SF",
"dsc": "حول النظام",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
},
{
"id": 41,
"fn_id": 33,
"enabled": "Y",
"visible": "Y",
"ord": 9,
"parent": 7,
"caption": "كشف أسماء الحسابات",
"ecaption": "Accounts Name Sheet",
"children": [],
"function_name": {
"fn_id": 33,
"fn": "rfAccountsNames",
"fn_type": "RF",
"dsc": "كشف أسماء الحسابات",
"trial576": "T"
}
},
{
"id": 42,
"fn_id": 34,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 7,
"caption": "أرصدة مجموعة من الحسابات",
"ecaption": "Account Group Balances",
"children": [],
"function_name": {
"fn_id": 34,
"fn": "rfAccountsBalances",
"fn_type": "RF",
"dsc": "كشف أرصدة مجموعة من الحسابات",
"trial576": "T"
}
},
{
"id": 44,
"fn_id": 36,
"enabled": "Y",
"visible": "Y",
"ord": 1,
"parent": 7,
"caption": "كشوف حساب من رقم الى رقم",
"ecaption": "Statments Of Account By Account",
"children": [],
"function_name": {
"fn_id": 36,
"fn": "rfAccountReports",
"fn_type": "RF",
"dsc": "كشوف حساب من رقم الى رقم",
"trial576": "T"
}
},
{
"id": 45,
"fn_id": 37,
"enabled": "Y",
"visible": "Y",
"ord": 2,
"parent": 7,
"caption": "ميزان المراجعة",
"ecaption": "Trial Balance",
"children": [],
"function_name": {
"fn_id": 37,
"fn": "rfPostedReviewBalance",
"fn_type": "RF",
"dsc": "ميزان المراجعة",
"trial576": "T"
}
},
{
"id": 49,
"fn_id": 41,
"enabled": "Y",
"visible": "Y",
"ord": 9,
"parent": 7,
"caption": "اليومية العامة حسب التاريخ",
"ecaption": "Journal Voucher By Date",
"children": [],
"function_name": {
"fn_id": 41,
"fn": "rfJournalByDate",
"fn_type": "RF",
"dsc": "اليومية العامة حسب التاريخ",
"trial576": "T"
}
},
{
"id": 50,
"fn_id": 42,
"enabled": "Y",
"visible": "Y",
"ord": 10,
"parent": 7,
"caption": "اليومية العامة حسب أرقام السندات",
"ecaption": "Journal Voucher By Voucher No",
"children": [],
"function_name": {
"fn_id": 42,
"fn": "rfJournalByNo",
"fn_type": "RF",
"dsc": "اليومية العامة حسب أرقام السندات",
"trial576": "T"
}
},
{
"id": 61,
"fn_id": 53,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 7,
"caption": "كشف حساب مجموعة",
"ecaption": "SOA For Group",
"children": [],
"function_name": {
"fn_id": 53,
"fn": "rfGrpAccRep",
"fn_type": "SF",
"dsc": "كشف حساب مجموعة",
"trial576": "T"
}
},
{
"id": 72,
"fn_id": 63,
"enabled": "Y",
"visible": "Y",
"ord": 3,
"parent": 7,
"caption": "كشف أعمار الذمم",
"ecaption": "كشف أعمار الذمم",
"children": [],
"function_name": {
"fn_id": 63,
"fn": "rfAgingRep",
"fn_type": "RF",
"dsc": "كشف أعمار الذمم",
"trial576": "T"
}
},
{
"id": 205,
"fn_id": 205,
"enabled": "Y",
"visible": "Y",
"ord": 102,
"parent": 7,
"caption": "تقرير تحليل الحسابات السنوي",
"ecaption": "تقارير محاسبية مخصصة",
"children": [],
"function_name": {
"fn_id": 205,
"fn": "rfAccRep5",
"fn_type": "RF",
"dsc": "تقارير محاسبية مخصصة",
"trial576": "T"
}
},
{
"id": 206,
"fn_id": 206,
"enabled": "Y",
"visible": "Y",
"ord": 102,
"parent": 7,
"caption": "تقرير تحليل التحصيلات لمندوبي المبيعات",
"ecaption": "تقارير محاسبية مخصصة",
"children": [],
"function_name": {
"fn_id": 206,
"fn": "rfAccRep6",
"fn_type": "RF",
"dsc": "تقارير محاسبية مخصصة",
"trial576": "T"
}
}
],
"function_name": {
"fn_id": 0,
"fn": "non",
"fn_type": "non",
"dsc": "no corresbonding function",
"trial576": "T"
}
}
] ''';

  static Future<List<MenueItemModel>> getMenues() async {
    List<MenueItemModel> menues = List.generate(json.decode(jsonData).length,
        (index) => MenueItemModel.fromJson(json.decode(jsonData)[index]));

    // menues.forEach((element) {
    //   print("element Big 1 ${element.id} || ${element.caption}");
    //   element.children!.forEach((ele) {
    //     print("element child 1 ${ele.id} || ${ele.caption}");
    //     ele.children!.forEach((el) {
    //       print("element child 2 ${ele.id} || ${ele.caption}");
    //     });
    //   });
    // });
    return menues;
  }

  static Children? getChildren(Children child) {
    print("Fkfkf ${child.caption}");
    if (child.children!.isEmpty) {
      return null;
    } else {
      return child;
    }
  }

  static Widget recursePls(Children child) {
    if (child.children!.isEmpty) {
      return Text(child.ecaption!);
    } else {
      return Column(
        children: [
          Text(child.ecaption!),
          ...List.generate(child.children!.length,
              (index) => recursePls(child.children![index])),
        ],
      );
    }
  }
}
