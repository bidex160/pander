int timeToMilliseconds(int hour, int minutes) {
  return ((hour * 60 * 60) + (minutes * 60)) * 1000;
}

int timeConverter(int hour) {
  if (hour <= 12) return hour;

  return hour - 12;
}