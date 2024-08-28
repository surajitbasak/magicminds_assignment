///Takes a [response] and parses it into a list of [T] objects.
List<T> parseJsonList<T>(dynamic response, T Function(Map<String, dynamic>) fromJson) {
  List<dynamic> jsonList = response;
  return jsonList.map((e) => fromJson(e)).toList();
}
