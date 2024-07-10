import 'dart:collection';

class JustifyAbsencesRequestDto extends MapView<String, dynamic> {
  final String reason;
  final String evidenceUrl;
  final String? studentNote;
  final List<int> unjustifiedAbsencesIds;

  JustifyAbsencesRequestDto({
    required this.reason,
    required this.evidenceUrl,
    this.studentNote,
    required this.unjustifiedAbsencesIds,
  }) : super({
          "reason": reason,
          "evidenceUrl": evidenceUrl,
          "studentNote": studentNote,
          "unjustifiedAbsencesIds": unjustifiedAbsencesIds,
        });
}
