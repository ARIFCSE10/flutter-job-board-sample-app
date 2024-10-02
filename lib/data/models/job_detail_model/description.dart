import 'package:freezed_annotation/freezed_annotation.dart';

import 'op.dart';

part 'description.freezed.dart';
part 'description.g.dart';

@freezed
class Description with _$Description {
  factory Description({
    List<Op>? ops,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}
