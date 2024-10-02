import 'package:freezed_annotation/freezed_annotation.dart';

part 'op.freezed.dart';
part 'op.g.dart';

@freezed
class Op with _$Op {
  factory Op({
    String? insert,
  }) = _Op;

  factory Op.fromJson(Map<String, dynamic> json) => _$OpFromJson(json);
}
