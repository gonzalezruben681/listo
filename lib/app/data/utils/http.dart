/// Import Flutter
import 'dart:io';
import 'dart:async';
import 'dart:convert';

/// Import Libraries
import 'package:http/http.dart' as http;

import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/domain/entities/utils/error_dto.dart';

/// Import Entities
import 'package:listo/app/domain/entities/generic_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Respositories
import 'package:listo/app/data/repository_impl/preferences_repository_impl/preferences_repository_impl.dart';

/// Import Utils
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_endpoints.dart';

class HttpService {
  final Map<String, dynamic>? body;
  final String endPoint;
  final String? token;

  HttpService({this.body, required this.endPoint, this.token});

  Future<Object?> getHttp() async {
    try {
      final ConfiguracionDTO configuracion = await obtenerConfiguracion();

      final Map<String, String> headers =
          obtenerCabeceras(token, configuracion.puertoMovil);

      final http.Response respuesta = await http
          .get(
              Uri.parse(configuracion.urlPuente! +
                  ConstantesEndpoints.urlBase +
                  endPoint),
              headers: headers)
          .timeout(Duration(minutes: 5), onTimeout: () {
        throw TimeoutException('Time Out');
      });

      GenericoDTO genericDto =
          GenericoDTO.fromJson(json.decode(respuesta.body));

      if (genericDto.status == 200) {
        return genericDto.payload;
      } else if (genericDto.status == 500) {
        throw BadRequestException(
            ErrorDto.fromJson(genericDto.jsonStringify(genericDto.payload)));
      } else if (genericDto.status == 401) {
        final errorDto =
            ErrorDto.fromJson(genericDto.jsonStringify(genericDto.payload));
        throw UnauthorisedException(ErrorDto(
            codigo: genericDto.status.toString(),
            mensaje: errorDto.mensaje,
            recomendacion: errorDto.recomendacion));
      }
    } on BadRequestException catch (e) {
      throw FetchDataException(e.error);
    } on UnauthorisedException catch (e) {
      throw FetchDataException(e.error);
    } on SocketException {
      throw FetchDataException(ErrorGeneral().errorNavegacion());
    } on TimeoutException {
      throw FetchDataException(ErrorGeneral().errorTimeOut());
    } catch (_) {
      throw FetchDataException(ErrorGeneral().errorNoControlado());
    }
  }

  Future<Object?> postHttp() async {
    try {
      final ConfiguracionDTO configuracion = await obtenerConfiguracion();

      final Map<String, String> headers =
          obtenerCabeceras(token, configuracion.puertoMovil);

      final http.Response respuesta = await http
          .post(
        Uri.parse(
            configuracion.urlPuente! + ConstantesEndpoints.urlBase + endPoint),
        headers: headers,
        body: json.encode(body),
      )
          .timeout(Duration(minutes: 5), onTimeout: () {
        throw TimeoutException('Time Out');
      });

      GenericoDTO genericDto =
          GenericoDTO.fromJson(json.decode(respuesta.body));

      if (genericDto.status == 200) {
        return genericDto.payload;
      } else if (genericDto.status == 500) {
        throw BadRequestException(
            ErrorDto.fromJson(genericDto.jsonStringify(genericDto.payload)));
      } else if (genericDto.status == 401) {
        throw UnauthorisedException(
            ErrorDto.fromJson(genericDto.jsonStringify(genericDto.payload)));
      }
    } on BadRequestException catch (e) {
      throw FetchDataException(e.error);
    } on UnauthorisedException catch (e) {
      throw FetchDataException(e.error);
    } on SocketException {
      throw FetchDataException(ErrorGeneral().errorNavegacion());
    } on TimeoutException {
      throw FetchDataException(ErrorGeneral().errorTimeOut());
    } catch (_) {
      throw FetchDataException(ErrorGeneral().errorNoControlado());
    }
  }

  Future<ConfiguracionDTO> obtenerConfiguracion() async {
    final configuracionLocal =
        await PreferencesRepositoryImpl().read("configuracion");

    ConfiguracionDTO configuracion =
        ConfiguracionDTO.fromJson(configuracionLocal);

    if (configuracionLocal.isEmpty) {
      throw BadRequestException(ErrorGeneral().errorConfiguracion());
    }

    return configuracion;
  }

  Map<String, String> obtenerCabeceras(String? token, String? pruertoMovil) {
    final Map<String, String> listaCabeceras = <String, String>{};

    listaCabeceras.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');

    listaCabeceras.putIfAbsent("Port-Mobile", () => pruertoMovil ?? "");

    if (token != null && token.isNotEmpty) {
      listaCabeceras.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer ' + token);
    }

    return listaCabeceras;
  }
}
