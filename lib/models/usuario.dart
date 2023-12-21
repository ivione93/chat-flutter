import 'dart:convert';

class Usuario {
    String nombre;
    String email;
    bool online;
    String uid;

    Usuario({
        required this.nombre,
        required this.email,
        required this.online,
        required this.uid,
    });

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        online: json["online"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "online": online,
        "uid": uid,
    };
}
