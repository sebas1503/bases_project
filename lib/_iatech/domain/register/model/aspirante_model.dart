class Candidate {
  String? nombre;
  String? apellido;
  String? cedula;
  String? fechaNacimiento;
  String? email;
  String? telefono;
  String? direccion;
  String? ciudad;
  String? cargo;
  double? salario;
  String? nivelEstudios;

  Candidate({
    this.nombre,
    this.apellido,
    this.cedula,
    this.fechaNacimiento,
    this.email,
    this.telefono,
    this.direccion,
    this.ciudad,
    this.cargo,
    this.salario,
    this.nivelEstudios,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
      nombre: json['Nombre'],
      apellido: json['Apellido'],
      cedula: json['Cedula'],
      fechaNacimiento: json['Fecha_Nacimiento'],
      email: json['Email'],
      telefono: json['Telefono'],
      direccion: json['Direccion'],
      ciudad: json['Ciudad'],
      cargo: json['Cargo'],
      salario: json['Salario'],
      nivelEstudios: json['Nivel_estudios']);

  Map<String, dynamic> toJson() {
    return {
      'Nombre': nombre,
      'Apellido': apellido,
      'Cedula': cedula,
      'Fecha_Nacimiento': fechaNacimiento,
      'Email': email,
      'Telefono': telefono,
      'Direccion': direccion,
      'Ciudad': ciudad,
      'Cargo': cargo,
      'Salario': salario,
      'Nivel_Estudios': nivelEstudios,
    };
  }
}
