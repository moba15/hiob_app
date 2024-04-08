class Pair<T, U> {
  T first;
  U second;
  Pair({required this.first, required this.second});

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
      };

  factory Pair.fromJSON(Map<String, dynamic> json) {
    return Pair(first: json["first"], second: json["second"]);
  }
}
