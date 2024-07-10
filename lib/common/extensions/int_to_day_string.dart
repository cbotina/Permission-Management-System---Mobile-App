extension ToDayString on int {
  String toDayString() {
    switch (this) {
      case 1:
        return 'MON';
      case 2:
        return 'TUE';
      case 3:
        return 'WED';
      case 4:
        return 'THU';
      case 5:
        return 'FRI';
      default:
        return '';
    }
  }
}
