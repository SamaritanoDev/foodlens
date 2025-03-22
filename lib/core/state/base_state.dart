import 'package:flutter/material.dart';

enum ViewState { inactivo, loading, success, error }

class BaseState extends ChangeNotifier {
  ViewState _state = ViewState.inactivo;
  String? _errorMessage;

  ViewState get state => _state;
  String? get errorMessage => _errorMessage;

  void setLoading() {
    _state = ViewState.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void setSuccess() {
    _state = ViewState.success;
    notifyListeners();
  }

  void setError(String message) {
    _state = ViewState.error;
    _errorMessage = message;
    notifyListeners();
  }

  void reset() {
    _state = ViewState.inactivo;
    _errorMessage = null;
    notifyListeners();
  }
}
