enum AxisType {
  X,Y
}
enum AxisDataType {
  numbers,dates
}
class Axis {
  AxisType type;
  String description;
  AxisDataType dataType;
  int dataInterval;
  int max;
  int min;

  Axis(this.type, this.description, this.dataType, this.dataInterval, this.max, this.min);
}