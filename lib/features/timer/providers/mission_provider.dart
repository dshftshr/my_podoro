import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'streak_provider.dart';
import 'history_provider.dart';

part 'mission_provider.g.dart';

class MissionState {
  final int targetCycles;
  final int completedCycles;
  final String taskType;
  final List<String> subTasks;

  MissionState({
    required this.targetCycles,
    required this.completedCycles,
    this.taskType = 'Belajar',
    this.subTasks = const [],
  });

  MissionState copyWith({
    int? targetCycles,
    int? completedCycles,
    String? taskType,
    List<String>? subTasks,
  }) {
    return MissionState(
      targetCycles: targetCycles ?? this.targetCycles,
      completedCycles: completedCycles ?? this.completedCycles,
      taskType: taskType ?? this.taskType,
      subTasks: subTasks ?? this.subTasks,
    );
  }
}

@Riverpod(keepAlive: true)
class MissionNotifier extends _$MissionNotifier {
  @override
  MissionState build() {
    return MissionState(targetCycles: 0, completedCycles: 0);
  }

  void setTargetCycles(int target) {
    state = state.copyWith(targetCycles: target);
  }

  void startMission(int target, String type, List<String> tasks) {
    state = state.copyWith(targetCycles: target, completedCycles: 0, taskType: type, subTasks: tasks);
  }

  void addCompletedCycle() {
    state = state.copyWith(completedCycles: state.completedCycles + 1);

    // Reward streak when mission is fully completed
    if (state.completedCycles == state.targetCycles && state.targetCycles > 0) {
      ref.read(streakNotifierProvider.notifier).incrementStreakIfEligible();
      ref.read(historyNotifierProvider.notifier).saveHistory(state.taskType, state.targetCycles, state.subTasks);
    }
  }

  void resetMission() {
    state = state.copyWith(targetCycles: 0, completedCycles: 0, subTasks: []);
  }
}
