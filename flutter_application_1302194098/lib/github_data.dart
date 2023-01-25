

// ignore_for_file: camel_case_types, non_constant_identifier_names


class userGithub {
  final int id;
  final String name;
  final String bio;

  final String avatar_url;
  const userGithub({
    required this.id,
    required this.name,
    required this.bio,

    required this.avatar_url,
  });
  factory userGithub.fromJson(Map<String, dynamic> json) {
    return userGithub(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      avatar_url: json['avatar_url'],
    );
  }
}

class dataFirebase{
  final String title;
  final String message;

  const dataFirebase({
    required this.title,
    required this.message,
  });
}
