import 'package:wisatah_malang/service/apiException.dart';

enum Status { COMPLETED, ERROR, DIOERROR }

class ApiModel<T> {
  Status status;
  T data;
  String message;
  AppException error;

  ApiModel.completed(this.data) : status = Status.COMPLETED;
  ApiModel.error(this.message) : status = Status.ERROR;
  ApiModel.dioError(this.error) : status = Status.DIOERROR;
  
}
