enum TimestampType { lastchanged, lastupdated }

enum TimestampLayout { under, above }

class TimestampSettings {
  TimestampType timestampType;

  TimestampLayout timestampShow;

  TimestampSettings({required this.timestampShow, required this.timestampType});
}
