
class Contact {
  final int id;
  final String name;
  final String facebook;
  final String twitter;
  final String linkedin;  

  Contact({this.id, this.name, this.facebook, this.twitter, this.linkedin});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'facebook': facebook,
      'twitter' : twitter,
      'linkedin' : linkedin
    };
  }
}

