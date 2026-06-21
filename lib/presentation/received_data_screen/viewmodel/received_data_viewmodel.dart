import 'package:flutter_riverpod/legacy.dart';

import '../../../data/models/received_data_state.dart';
import '../../../data/sources/shares_preference/shared_preference.dart';

/// ********************** PROVIDER **********************
final receivedDataProvider =
    StateNotifierProvider<ReceivedDataViewModel, ReceivedDataState>(
      (ref) => ReceivedDataViewModel(),
    );

/// ********************** VIEWMODEL **********************
class ReceivedDataViewModel extends StateNotifier<ReceivedDataState> {
  ReceivedDataViewModel() : super(ReceivedDataState());

  /// ********************** INIT **********************
  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    final data = await ReceivedStorageService.getHistory();
    state = state.copyWith(history: data, isLoading: false);
  }
}
