/// Contains static lists for dropdowns: years, months, and days.
class DateData {
  /// Returns a list of years from 1900 to current year in descending order
  static List<String> get years {
    final currentYear = DateTime.now().year;
    return List.generate(
      currentYear - 1900 + 1,
          (index) => (1900 + index).toString(),
    ).reversed.toList();
  }

  /// List of month numbers as strings (01 to 12)
  static List<String> get months =>
      List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));

  /// List of month names (January to December)
  static List<String> get monthNames => const [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /// List of days (01 to 31)
  static List<String> get days =>
      List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
}
