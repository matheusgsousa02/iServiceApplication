import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:service_app/models/address.dart';
import 'package:service_app/models/user_info.dart';

class AddressServices {
  final String _baseUrl = 'http://10.0.2.2:5120/Address';

  Future<Address?> getById(int addressId) async {
    return _getRequest('', addressId);
  }

  Future<UserInfo> save(UserInfo request) async {
    return _postRequest('/Save', request);
  }

  Future<Address?> _getRequest(String path, int id) async {
    var url = Uri.parse('$_baseUrl$path/$id');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Address?.fromJson(jsonDecode(response.body));
    } else {
      _handleError(response.body);
    }
    throw Exception('Não foi possível completar a requisição para $path.');
  }

  Future<UserInfo> _postRequest(String path, UserInfo request) async {
    var url = Uri.parse('$_baseUrl$path');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserInfo.fromJson(jsonDecode(response.body));
    } else {
      _handleError(response.body);
    }
    throw Exception('Não foi possível completar a requisição para $path.');
  }

  Exception _handleError(String responseBody) {
    var jsonResponse = jsonDecode(responseBody);
    var errorMessage = jsonResponse['message'] ?? 'Erro desconhecido';
    throw Exception(errorMessage);
  }
}
