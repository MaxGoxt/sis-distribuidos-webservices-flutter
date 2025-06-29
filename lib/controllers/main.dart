import 'dart:convert';

import 'package:sis_distribuidos_webservices/models/centro_medico.dart';
import 'package:sis_distribuidos_webservices/models/familiar.dart';
import 'package:sis_distribuidos_webservices/models/paciente.dart';
import 'package:http/http.dart' as http;

class API {
  final String baseUrl = 'http://localhost:8080';

  Future<List<Familiar>> getFamiliares() async {
    final response = await http.get(Uri.parse('$baseUrl/familiares'));
    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List<dynamic>;
      return data.map((item) => Familiar.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load familiares');
    }
  }

  Future<Familiar> getFamiliarById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/familiares/$id'));
    if (response.statusCode == 200) {
      return Familiar.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load familiar');
    }
  }

  Future<Familiar> createFamiliar(Familiar familiar) async {
    final response = await http.post(
      Uri.parse('$baseUrl/familiares'),
      headers: {'Content-Type': 'application/json'},
      body: familiar.toJson(),
    );
    if (response.statusCode == 201) {
      return Familiar.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create familiar');
    }
  }

  Future<Familiar> updateFamiliar(int id, Familiar familiar) async {
    final response = await http.put(
      Uri.parse('$baseUrl/familiares/$id'),
      headers: {'Content-Type': 'application/json'},
      body: familiar.toJson(),
    );
    if (response.statusCode == 200) {
      return Familiar.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to update familiar');
    }
  }

  Future<void> deleteFamiliar(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/familiares/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete familiar');
    }
  }

  Future<List<Paciente>> getPacientes() async {
    final response = await http.get(Uri.parse('$baseUrl/pacientes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Paciente.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load pacientes');
    }
  }

  Future<Paciente> getPacienteById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pacientes/$id'));
    if (response.statusCode == 200) {
      return Paciente.fromMap(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load paciente');
    }
  }

  Future<Paciente> createPaciente(Paciente paciente) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pacientes'),
      headers: {'Content-Type': 'application/json'},
      body: paciente.toJson(),
    );
    if (response.statusCode == 201) {
      return Paciente.fromMap(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create paciente');
    }
  }

  Future<Paciente> updatePaciente(int id, Paciente paciente) async {
    final response = await http.put(
      Uri.parse('$baseUrl/pacientes/$id'),
      headers: {'Content-Type': 'application/json'},
      body: paciente.toJson(),
    );
    if (response.statusCode == 200) {
      return Paciente.fromMap(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to update paciente');
    }
  }

  Future<void> deletePaciente(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/pacientes/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete paciente');
    }
  }

  Future<List<CentroMedico>> getCentrosMedicos() async {
    final response = await http.get(Uri.parse('$baseUrl/centrosmedicos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body) as List<dynamic>;
      return data.map((item) => CentroMedico.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load centros medicos');
    }
  }

  Future<CentroMedico> getCentroMedicoById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/centrosmedicos/$id'));
    if (response.statusCode == 200) {
      return CentroMedico.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load centro medico');
    }
  }

  Future<CentroMedico> createCentroMedico(CentroMedico centroMedico) async {
    final response = await http.post(
      Uri.parse('$baseUrl/centrosmedicos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(centroMedico.toJson()),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return CentroMedico.fromMap(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to create centro medico');
    }
  }

  Future<CentroMedico> updateCentroMedico(
    int id,
    CentroMedico centroMedico,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/centros_medicos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: centroMedico.toJson(),
    );
    if (response.statusCode == 200) {
      return CentroMedico.fromMap(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to update centro medico');
    }
  }

  Future<void> deleteCentroMedico(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/centrosmedicos/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete centro medico');
    }
  }
}
