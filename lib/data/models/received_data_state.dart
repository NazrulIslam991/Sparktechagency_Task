class ReceivedDataState {
  final List<Map<String, dynamic>> history;
  final bool isLoading;

  ReceivedDataState({this.history = const [], this.isLoading = true});

  ReceivedDataState copyWith({
    List<Map<String, dynamic>>? history,
    bool? isLoading,
  }) {
    return ReceivedDataState(
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
