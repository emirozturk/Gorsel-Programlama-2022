import 'user.dart';

class UserSimiliarity {
  final User user;
  final double score;
  UserSimiliarity(this.user, this.score);
  UserSimiliarity.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        score = json["score"].toDouble();
}
