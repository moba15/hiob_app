enum SubType { interval, smart }

class HistorySubscription {
  SubType type;

  HistorySubscription({required this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistorySubscription && other.type == type;
}
