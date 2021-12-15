class ReportArg {
  final int reviewId;
  final void Function(int reviewId) onReport;

  ReportArg({
    required this.reviewId,
    required this.onReport,
  });
}
