class TripResult {
  final double costPerStudent;
  final double busCost;
  final double totalCost;
  final int students;

  TripResult({
    required this.costPerStudent,
    required this.busCost,
    required this.totalCost,
    required this.students,
  });
}

TripResult calculateTripCost(int students) {
  if (students <= 0) {
    throw Exception('Número de alumnos inválido');
  }

  double costPerStudent;
  double busCost;

  if (students >= 100) {
    costPerStudent = 65;
    busCost = students * costPerStudent;
  } else if (students >= 50) {
    costPerStudent = 70;
    busCost = students * costPerStudent;
  } else if (students >= 30) {
    costPerStudent = 95;
    busCost = students * costPerStudent;
  } else {
    costPerStudent = 4000 / students;
    busCost = 4000;
  }

  return TripResult(
    students: students,
    costPerStudent: costPerStudent,
    busCost: busCost,
    totalCost: busCost,
  );
}
