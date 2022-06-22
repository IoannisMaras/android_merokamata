import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProvider =
    StateNotifierProvider<SelectDayController, DateTime?>((ref) {
  return SelectDayController();
});

class SelectDayController extends StateNotifier<DateTime?> {
  SelectDayController() : super(null);

  void change(DateTime time) {
    //print("test");
    state = time;
  }
}
