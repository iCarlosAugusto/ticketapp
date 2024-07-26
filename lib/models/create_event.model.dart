class CreateEventModel {

  String name;
  String description;

  CreateEventModel({required this.name, required this.description});

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'description': description,
    };
  }

  factory CreateEventModel.fromJson(Map<String, dynamic> map) {
    return CreateEventModel(
      name: map['nome'],
      description: map['description']
    );
  }
}