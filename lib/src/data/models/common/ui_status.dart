class UIStatus {
  bool isLoading;
  bool success;
  bool successWithAlert;
  String message;

  UIStatus({this.isLoading = false, this.success = false, this.successWithAlert = false, this.message = ''});
}
