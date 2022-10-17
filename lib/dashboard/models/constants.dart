enum TagEnum {
  all('All'),
  indian('Indian'),
  italian('Italian'),
  asian('Asian'),
  chinese('Chinese'),
  other('Other');

  final String value;
  const TagEnum(this.value);
}

enum TimeEnum {
  all('All'),
  newest('Newest'),
  oldest('Oldest'),
  popularity('Popularity');

  final String value;
  const TimeEnum(this.value);
}

enum StarsEnum {
  best('4-5', 5),
  veryGood('3-4', 4),
  good('2-3', 3),
  normal('1-2', 2),
  bad('0-1', 1);

  final String value;
  final int maxValue;
  const StarsEnum(this.value, this.maxValue);
}
