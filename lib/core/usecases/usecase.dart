import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class NoParams {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
