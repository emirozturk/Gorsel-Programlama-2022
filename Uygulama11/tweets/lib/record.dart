class Record {
  String? tweet;
  DateTime? datetime;
  Record(this.tweet, this.datetime);
  Map<String, dynamic> toJson() {
    return {
      "tweet": tweet!,
      "datetime": datetime.toString(),
    };
  }

  Record.fromJson(Map<String, dynamic> map) {
    tweet = map["tweet"].toString();
    datetime = DateTime.parse(map["datetime"].toString());
  }
}
