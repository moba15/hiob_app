enum TimestampDisplayType { timePast, date }

class TimestampDisplay {
  TimestampDisplayType timestampDisplayType;

  TimestampDisplay({required this.timestampDisplayType});
}

class _TimestampDisplayImpl {
  TimestampDisplayType timestampDisplayType;

  _TimestampDisplayImpl({required this.timestampDisplayType});
}

class _TimestampDisplayTimePastImpl extends _TimestampDisplayImpl {
  _TimestampDisplayTimePastImpl(
      {required TimestampDisplayType timestampDisplayType})
      : super(timestampDisplayType: timestampDisplayType);
}

class _TimestampDisplayDateImpl extends _TimestampDisplayImpl {
  _TimestampDisplayDateImpl(
      {required TimestampDisplayType timestampDisplayType})
      : super(timestampDisplayType: timestampDisplayType);
}
