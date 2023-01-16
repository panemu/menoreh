import 'package:equatable/equatable.dart';
import 'package:data/core/_core.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  const AuthFailure({message}) : super(message: message);
  
  @override
  List<Object?> get props => [message];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({message = FAILURE_NOT_FOUND}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  const UnknownFailure({message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
