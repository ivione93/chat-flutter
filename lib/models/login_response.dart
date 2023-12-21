import 'dart:convert';

import 'package:chat/models/usuario.dart';

class LoginResponse {
    bool ok;
    Usuario usuario;
    String token;

    LoginResponse({
        required this.ok,
        required this.usuario,
        required this.token,
    });

    factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
    };
}
