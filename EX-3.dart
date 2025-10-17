class CustomDuration {
  final num _milliseconds;

  CustomDuration.milliseconds(this._milliseconds);
  CustomDuration.fromHours(num hours)
    : this._milliseconds = hours >= 0
          ? hours * 3600000
          : throw Exception("Duration must be positive.");
  CustomDuration.fromMinutes(num minutes)
    : this._milliseconds = minutes >= 0
          ? minutes * 60000
          : throw Exception("Duration must be positive.");
  CustomDuration.fromSeconds(num seconds)
    : this._milliseconds = seconds >= 0
          ? seconds * 1000
          : throw Exception("Duration must be positive.");

  num get Hours => (_milliseconds / 3600000);
  num get Minutes => (_milliseconds / 60000);
  num get Seconds => (_milliseconds / 1000);
  num get milliseconds => _milliseconds;

  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration.milliseconds(_milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    return CustomDuration.milliseconds(_milliseconds - other._milliseconds);
  }
}

void main() {
  try {
    CustomDuration d1 = CustomDuration.fromHours(2);
    CustomDuration d2 = CustomDuration.fromMinutes(90);
    print((d1 + d2).Minutes);
    print((d1 - d2).Hours);
    print(d1 > d2);
  } catch (e) {
    print(e);
  }
}
