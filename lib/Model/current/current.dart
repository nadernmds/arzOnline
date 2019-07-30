import 'dart:convert';
import 'package:arzonline/Model/Api.dart';

class Currency extends Api {
  String url;
  String currencyName;
  List<Info> info;

  Currency({this.url, this.currencyName, this.info});

  Currency.fromJson(x) {
    if (x == null) return;
    this.url = x["url"];
    this.currencyName = x["currencyName"];
    this.info = List<Info>();
    for (var item in x['infos']) {
      this.info.add(Info.fromJson(item));
    }
  }
  Future<List<Currency>> getCurrencies() async {
    var res = await getUrl('cur/');
    var p = jsonDecode(res.body);
    List<Currency> currencies = List<Currency>();
    for (var item in p) {
      currencies.add(Currency.fromJson(item));
    }
    return currencies;
  }

  Future<List<Currency>> getCurrency(int id) async {
    var res = await getUrl('cur/' + id.toString());
    var p = jsonDecode(res.body);
    List<Currency> currencies = List<Currency>();
    for (var item in p) {
      currencies.add(Currency.fromJson(item));
    }
    return currencies;
  }
}

class Info extends Api {
  String name;
  String value;
  bool high;

  Info({this.name, this.value, this.high});

  Info.fromJson(x) {
    if (x == null) return;
    this.name = x["name"];
    this.value = x["value"];
    this.high = x['high'];
  }
}
