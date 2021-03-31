class Name {
  final String text;

  Name({this.text});

  Map<String, dynamic> toMap() {
    return {
      'name': text,
    };
  }
}