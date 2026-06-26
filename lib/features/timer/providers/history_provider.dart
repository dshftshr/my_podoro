import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'history_provider.g.dart';

class TaskHistory {
  final String date; // "YYYY-MM-DD"
  final String taskType;
  final int cycles;
  final List<String> subTasks;
  final String timestamp; // "HH:mm"

  TaskHistory({
    required this.date,
    required this.taskType,
    required this.cycles,
    required this.subTasks,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'date': date,
        'taskType': taskType,
        'cycles': cycles,
        'subTasks': subTasks,
        'timestamp': timestamp,
      };

  factory TaskHistory.fromJson(Map<String, dynamic> json) {
    return TaskHistory(
      date: json['date'],
      taskType: json['taskType'],
      cycles: json['cycles'],
      subTasks: List<String>.from(json['subTasks']),
      timestamp: json['timestamp'],
    );
  }
}

@Riverpod(keepAlive: true)
class HistoryNotifier extends _$HistoryNotifier {
  @override
  List<TaskHistory> build() {
    _loadHistory();
    return [];
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('podoro_task_history');
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      state = decoded.map((item) => TaskHistory.fromJson(item)).toList();
    }
  }

  Future<void> saveHistory(String taskType, int cycles, List<String> subTasks) async {
    final now = DateTime.now();
    final date = now.toIso8601String().substring(0, 10);
    final timestamp = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    final newHistory = TaskHistory(
      date: date,
      taskType: taskType,
      cycles: cycles,
      subTasks: subTasks,
      timestamp: timestamp,
    );

    state = [...state, newHistory];

    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(state.map((e) => e.toJson()).toList());
    await prefs.setString('podoro_task_history', jsonString);
  }
}
