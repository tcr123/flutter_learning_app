class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry({
      required this.title,
      required this.icon,
      required this.description,
      required this.views,
      required this.responses,
      required this.answered
  });
}
