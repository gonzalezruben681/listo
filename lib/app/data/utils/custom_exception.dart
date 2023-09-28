/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';

class CustomException implements Exception {
  ErrorDto error;

  CustomException(this.error);

  ErrorDto msgError() {
    return error;
  }
}

class FetchDataException extends CustomException {
  FetchDataException(ErrorDto error) : super(error);
}

class BadRequestException extends CustomException {
  BadRequestException(ErrorDto error) : super(error);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(ErrorDto error) : super(error);
}

class InvalidInputException extends CustomException {
  InvalidInputException(ErrorDto error) : super(error);
}
