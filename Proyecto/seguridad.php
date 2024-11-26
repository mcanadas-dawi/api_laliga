<?php
require 'vendor/autoload.php'; // Asegúrate de tener instalada la librería JWT (e.g., Firebase JWT)

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// Clave secreta para firmar los tokens
$secretKey = "MarcCs11";

// Definir los datos de usuario (esto debería estar almacenado en una base de datos en un entorno real)
$usuariosValidos = [
    "Marc" => "marc" 
];

// Obtener los parámetros de la solicitud (en este caso, usuario y contraseña desde los query params)
$usuario = $_GET['usuario'] ?? null;
$password = $_GET['password'] ?? null;

// Validar las credenciales
if (isset($usuariosValidos[$usuario]) && $usuariosValidos[$usuario] === $password) {
    // Credenciales válidas, generar el token JWT
    $issuedAt = time();
    $expirationTime = $issuedAt + 3600; // 1 hora de validez
    $payload = [
        "iat" => $issuedAt,  // Hora de emisión
        "exp" => $expirationTime,  // Hora de expiración
        "usuario" => $usuario  // Información del usuario
    ];
    
    // Generar el token JWT
    $jwt = JWT::encode($payload, $secretKey, 'HS256');
    
    // Responder con el token
    echo json_encode([
        "token" => $jwt
    ]);
} else {
    // Si las credenciales no son válidas, devolver error 401
    http_response_code(401); // Unauthorized
    echo json_encode(["error" => "Credenciales inválidas"]);
}
?>
