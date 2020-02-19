import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_demo/models/home/photo.dart';

enum HomeModelStatus {
  Ended,
  Loading,
  Error,
}

class HomeModel extends ChangeNotifier {
  HomeModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  HomeModelStatus get status => _status;

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  HomeModel();

  HomeModel.instance() {
    getter();
  }

  void getter() async {
    _status = HomeModelStatus.Loading;
    notifyListeners();

    try {
      _photos = await Photo.fetchPhotos(http.Client());
      _status = HomeModelStatus.Ended;
    } catch (e) {
      _errorMessage = e.toString();
      _status = HomeModelStatus.Error;
    }

    notifyListeners();
  }

  void setter() {
    _status = HomeModelStatus.Loading;
    notifyListeners();
    // Add code here for setter
    _status = HomeModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = HomeModelStatus.Loading;
    notifyListeners();
    // Add code here for update
    _status = HomeModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = HomeModelStatus.Loading;
    notifyListeners();
    // Add code here for remove
    _status = HomeModelStatus.Ended;
    notifyListeners();
  }
}
