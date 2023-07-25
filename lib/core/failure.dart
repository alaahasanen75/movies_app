import 'package:equatable/equatable.dart';

 class Failure extends Equatable {
  String msg;
  Failure(this.msg);
   List<Object?> get props => [msg];
}


class ServerFailure extends Failure{
  ServerFailure(super.msg);

}

class DbFailure extends Failure{
  DbFailure(super.msg);

}