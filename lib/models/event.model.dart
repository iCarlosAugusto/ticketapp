class Event {
  final String name;
  final String? description;

  Event({
    required this.name,
    this.description,
  });

  // Método para converter o objeto para um mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  // Método para criar um objeto a partir de um mapa (JSON)
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  @override
  String toString() {
    return 'Event(name: $name, description: $description)';
  }
}
