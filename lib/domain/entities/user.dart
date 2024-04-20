class User {
  String? name;
  String? prenom;
  int? number;
  String? email;

  User({
    this.name,
    this.prenom,
    this.number,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      prenom: json['prenom'],
      number: json['number'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['prenom'] = prenom;
    data['number'] = number;
    data['email'] = email;
    return data;
  }
}
