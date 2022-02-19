import 'package:get/state_manager.dart';

class TimelineController extends GetxController {
  RxMap<DateTime, RxBool> dates;

  final Rx<DateTime> _selectedDate;

  TimelineController({
    required this.dates,
    required DateTime currentDate,
  }) : _selectedDate = Rx(currentDate);

  void addDate(DateTime date, RxBool isSelected) {
    dates.addIf(!_isDuplicate(date), date, isSelected);
  }

  bool _isDuplicate(DateTime date) {
    return dates.containsKey(date);
  }

  void changeSelectedDate(DateTime date) {
    _changeDateBool(_selectedDate.value);
    _selectedDate.value = date;
    _changeDateBool(date);
  }

  void _changeDateBool(DateTime date) {
    dates.update(date, (isSelected) => _changeValue(isSelected));
  }

  RxBool _changeValue(RxBool value) {
    //
    return value.value ? false.obs : true.obs;
  }
}
