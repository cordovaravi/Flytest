import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flytest/Model.dart';

class FetchDataProvider extends ChangeNotifier {
  SamplePost? _samplePost;
  SamplePost? get postData => _samplePost;
  Future<Null> conversion() async {
    var decodedData =
        json.decode(await rootBundle.loadString('lib/sample.json'));
    _samplePost = SamplePost.fromJson(decodedData);
    log(_samplePost!.sample!.first.bedrooms.toString());
    notifyListeners();
  }
}
