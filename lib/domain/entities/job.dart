class JobEntity {
  final String id;
  final String title;
  final String company;
  final String location;
  final String type;
  final DateTime? postedTime;
  final String logo;

  JobEntity({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.postedTime,
    required this.logo,
  });
}
