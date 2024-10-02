class JobDetailEntity {
  final String id;
  final String jobTitle;
  final String companyName;
  final String location;
  final String jobType;
  final String companyLogo;
  final String jobDescription;
  final List<String> responsibilities;
  final String companyType;
  final List<String> tags;
  final String workplaceType;

  JobDetailEntity({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.companyLogo,
    required this.jobDescription,
    required this.responsibilities,
    required this.companyType,
    required this.tags,
    required this.workplaceType,
  });
}
