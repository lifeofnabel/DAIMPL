// Datei: Main.dfy
// Testfall für die Klasse Person
// Hinweis: Dafny führt den Code nicht aus, sondern verifiziert ihn logisch

method Main()
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
