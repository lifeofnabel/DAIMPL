// Eine Klasse zur Repräsentation einer Person
class Person {
  var name: string
  var age: nat  // 'nat' = natürliche Zahl (≥ 0)

  // Konstruktor mit Vorbedingungen
  constructor (n: string, a: nat)
    requires n != ""
    ensures name == n
    ensures age == a
  {
    name := n;
    age := a;
  }

  // Methode zum Aktualisieren des Namens
  method SetName(newName: string)
    requires newName != ""
    ensures name == newName
  {
    name := newName;
  }

  // Methode zum Aktualisieren des Alters
  method SetAge(newAge: nat)
    ensures age == newAge
  {
    age := newAge;
  }

  // Eine einfache Methode zur Ausgabe (nur symbolisch)
  method ToString() returns (s: string)
    ensures s == "Person(" + name + ", " + age.ToString() + ")"
  {
    s := "Person(" + name + ", " + age.ToString() + ")";
  }
}
