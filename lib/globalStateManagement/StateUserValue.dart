import 'package:flutter/cupertino.dart';

class StateUserValue with ChangeNotifier{
  bool _isRead = false;

  bool get isRead => _isRead;

  void changeRead(bool read){
    _isRead = !read;
    notifyListeners();
  }
}