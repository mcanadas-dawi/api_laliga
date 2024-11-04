<?php
// Obtiene el método de la solicitud
$method = $_SERVER['REQUEST_METHOD'];

// Permitir el acceso sin autenticación a las peticiones GET
if ($method === 'GET') {
    echo json_encode(['message' => 'Acceso permitido a peticiones GET.']);
} else {
    // Para los métodos POST, PUT y DELETE, verifica la autorización
    $headers = getallheaders();
    if (!isset($headers['Authorization'])) {
        http_response_code(401); // Unauthorized
        exit(json_encode(['error' => 'Token no proporcionado']));
    }

    $token = str_replace('Bearer ', '', $headers['Authorization']);
    
    // Aquí puedes verificar el "secret"
    if ($token === 'MarcCs11') {
        echo json_encode(['message' => 'Código correcto, la petición se ejecuta.']);
    } else {
        http_response_code(403); // Forbidden
        exit(json_encode(['error' => 'El código no es correcto']));
    }
}
