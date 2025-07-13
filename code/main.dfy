// Datei: Main.dfy
// Testfall für die MyLib-Bibliothek und die Person-Klasse
// Hinweis: Dafny führt den Code nicht aus, sondern verifiziert ihn logisch

method Main()
{
  // Test der MyLib-Methoden
  TestMyLibMethods();
  
  // Test der Person-Klasse (wie zuvor)
  TestPersonClass();
}

method TestMyLibMethods()
{
  // Test ComputeTotal
  var testArray := new int[4];
  testArray[0] := 1;
  testArray[1] := 2;
  testArray[2] := 3;
  testArray[3] := 4;
  
  var total := ComputeTotal(testArray);
  assert total == 10;
  
  // Test Max
  var testSeq := [5, 2, 8, 1, 9];
  var maxValue := Max(testSeq);
  assert maxValue == 9;
  
  // Test RoundNearest
  var rounded1 := RoundNearest(12.345);
  assert rounded1 == 1235;  // 12.345 -> 1235 Cent
  
  var rounded2 := RoundNearest(12.344);
  assert rounded2 == 1234;  // 12.344 -> 1234 Cent
  
  var rounded3 := RoundNearest(-7.891);
  assert rounded3 == -789;  // -7.891 -> -789 Cent
}

method TestPersonClass()
{
  // Erzeuge ein neues Person-Objekt mit gültigem Namen und Alter
  var p := new Person("Nabil", 25);

  // Aktualisiere den Namen – Dafny prüft automatisch, ob der Name nicht leer ist
  p.SetName("Denis");

  // Aktualisiere das Alter – es muss eine natürliche Zahl (>= 0) sein
  p.SetAge(30);

  // Rufe die ToString-Methode auf
  var result := p.ToString();

  // Überprüfe per Assertion, dass das Ergebnis wie erwartet ist
  assert result == "Person(Denis, 30)";
}
