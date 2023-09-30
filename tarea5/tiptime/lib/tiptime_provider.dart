import 'package:flutter/material.dart';

class TipTimeProvider extends ChangeNotifier {
  double? _costOfService;
  int? _selectedTip = 1; // Default to 20%
  double? _tipAmount = 0.0;
  bool _isRounded = false;

  double? get costOfService => _costOfService;
  int? get selectedTip => _selectedTip;
  double? get tipAmount => _tipAmount;
  bool get isRounded => _isRounded;

  void setSelectedTip(int? value) {
    _selectedTip = value;
    notifyListeners();
  }

  void setRounded(bool value) {
    _isRounded = value;
    notifyListeners();
  }

  void calculateService(double costOfService) {
    if (_selectedTip == 1) {
      _tipAmount = 0.2 * costOfService; // 20% tip
    } else if (_selectedTip == 2) {
      _tipAmount = 0.18 * costOfService; // 18% tip
    } else if (_selectedTip == 3) {
      _tipAmount = 0.15 * costOfService; // 15% tip
    }

    if (_isRounded) {
      _tipAmount = _tipAmount!.ceilToDouble(); // Round up the tip amount
    }

    _costOfService = costOfService;
    notifyListeners();
  }

  double calculateTotal() {
    if (_costOfService == null || _tipAmount == null) {
      return 0.0;
    }
    return _costOfService! + _tipAmount!;
  }
}
