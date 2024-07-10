import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/subject_group_students_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';

class MockSubjectGroupStudentsRepository
    implements ISubjectGroupStudentsRepository {
  @override
  Future<List<SubjectGroupStudentsView>> getSubjectGroupStudents(
      int subjectGroupId) async {
    return mockSubjectGroupStudents;
  }
}

final List<SubjectGroupStudentsView> mockSubjectGroupStudents = [
  const SubjectGroupStudentsView(
      studentId: 34, studentName: "Bastidas Delgado Karen Sofia"),
  const SubjectGroupStudentsView(
      studentId: 35, studentName: "Bastidas Erazo Nicol Alejandra"),
  const SubjectGroupStudentsView(
      studentId: 36, studentName: "Benavides Mirama Maria Fernanda"),
  const SubjectGroupStudentsView(
      studentId: 37, studentName: "Bermudes Arteaga Kayce Julieth"),
  const SubjectGroupStudentsView(
      studentId: 38, studentName: "Bravo Martinez Juan Andres"),
  const SubjectGroupStudentsView(
      studentId: 39, studentName: "Cabrera Pantoja Diana Elizabeth"),
  const SubjectGroupStudentsView(
      studentId: 40, studentName: "Castañena Guerrero Jeison Rodrigo"),
  const SubjectGroupStudentsView(
      studentId: 41, studentName: "Castillo Chaves Lina Valentina"),
  const SubjectGroupStudentsView(
      studentId: 42, studentName: "Davila Hernandez Vicky Zuleima"),
  const SubjectGroupStudentsView(
      studentId: 43, studentName: "Espinosa Guerrero Shaira Daniela"),
  const SubjectGroupStudentsView(
      studentId: 44, studentName: "Gomez Cepeda Lucy Del Carmen"),
  const SubjectGroupStudentsView(
      studentId: 45, studentName: "Huertas Jimenez Yenny Vanessa"),
  const SubjectGroupStudentsView(
      studentId: 46, studentName: "Jackson Claudia Adriana"),
  const SubjectGroupStudentsView(
      studentId: 47, studentName: "Jacome Medina Mayerli Vanessa"),
  const SubjectGroupStudentsView(
      studentId: 48, studentName: "Jamondino Benavides Estefani Daniela"),
  const SubjectGroupStudentsView(
      studentId: 49, studentName: "Jimenez Lopez Jonathan Stiven"),
  const SubjectGroupStudentsView(
      studentId: 50, studentName: "Jurado Santacruz Nancy Gabriela"),
  const SubjectGroupStudentsView(
      studentId: 51, studentName: "Kottaridis Calderon Lina Maria"),
  const SubjectGroupStudentsView(
      studentId: 52, studentName: "Marin Vasquez Daicy Sileny"),
  const SubjectGroupStudentsView(
      studentId: 53, studentName: "Muñoz Tutistar Jhon Sebastian"),
  const SubjectGroupStudentsView(
      studentId: 54, studentName: "Narvaez Salazar Dayana Marcela"),
  const SubjectGroupStudentsView(
      studentId: 55, studentName: "Ordonez Bolaños Herminsul Andres"),
  const SubjectGroupStudentsView(
      studentId: 56, studentName: "Ortega Palacios Gisella Nayiby"),
  const SubjectGroupStudentsView(
      studentId: 57, studentName: "Paz Rosero Ana Valeria"),
  const SubjectGroupStudentsView(
      studentId: 58, studentName: "Piscal Getial Francy Yesenia"),
  const SubjectGroupStudentsView(
      studentId: 59, studentName: "Quintas Ortega Maryory Fernanda"),
  const SubjectGroupStudentsView(
      studentId: 60, studentName: "Roque Tello Geraldine Tatiana"),
  const SubjectGroupStudentsView(
      studentId: 61, studentName: "Tumbaqui Villota Ingrid Vanessa"),
  const SubjectGroupStudentsView(
      studentId: 62, studentName: "Velazquez Pantoja Yeimy Gisel"),
];
