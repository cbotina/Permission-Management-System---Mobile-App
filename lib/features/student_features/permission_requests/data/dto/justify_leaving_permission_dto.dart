import 'dart:collection';

class JustifyLeavingPermissionDto extends MapView<String, dynamic> {
  final String evidenceUrl;

  JustifyLeavingPermissionDto({required this.evidenceUrl})
      : super({"evidenceUrl": evidenceUrl});
}
