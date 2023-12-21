import 'dart:convert';

import 'package:chat/models/usuario.dart';

class UsuariosResponse {
    bool ok;
    List<Usuario> usuarios;

    UsuariosResponse({
        required this.ok,
        required this.usuarios,
    });

    factory UsuariosResponse.fromRawJson(String str) => UsuariosResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsuariosResponse.fromJson(Map<String, dynamic> json) => UsuariosResponse(
        ok: json["ok"],
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };
}
