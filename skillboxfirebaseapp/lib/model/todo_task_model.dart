class Tasks {
  String color;
  String date;
  String name;
  String id;

  Tasks({
    required this.color,
    required this.date,
    required this.name,
    required this.id
  });

  static Tasks fromJson(Map<String, dynamic> json) => Tasks(
    color: json['color'],
    date: json['date'],
    name: json['name'],
    id: json['id']
  );

  Map<String, dynamic> toJson() => {
    'color': color,
    'date': date,
    'name': name,
    'id': id
  };
}