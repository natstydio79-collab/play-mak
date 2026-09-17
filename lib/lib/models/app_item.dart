class AppItem {
  final String name;
  final String description;
  final String iconUrl;
  final String owner;
  final String repo;
  String? installedVersion;

  AppItem({
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.owner,
    required this.repo,
    this.installedVersion,
  });
}
