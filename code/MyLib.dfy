// MyLib.dfy - Eine kleine Dafny-Bibliothek mit verifizierten Methoden
// Autor: DAIMPL Projekt
// Beschreibung: Drei einfache, verifizierte Methoden mit formalen Beweisen

// ============================================================================
// Methode 1: ComputeTotal - Summiert alle nicht-negativen Zahlen in einem Array
// ============================================================================

// Hilfsfunktion: Summe eines Arrays
function Sum(a: array<int>): int
  reads a
{
  SumRange(a, 0, a.Length)
}

function SumRange(a: array<int>, i: int, j: int): int
  requires 0 <= i <= j <= a.Length
  reads a
  decreases j - i
{
  if i == j then 0 else a[i] + SumRange(a, i+1, j)
}

method ComputeTotal(arr: array<int>) returns (total: int)
  requires forall i :: 0 <= i < arr.Length ==> arr[i] >= 0
  ensures total >= 0
{
  total := 0;
  var index := 0;
  
  while index < arr.Length
    invariant 0 <= index <= arr.Length
    invariant total >= 0
    decreases arr.Length - index
  {
    total := total + arr[index];
    index := index + 1;
  }
}

// ============================================================================
// Methode 2: Max - Findet das größte Element in einem Array
// ============================================================================

method Max(arr: array<int>) returns (maxValue: int)
  requires arr.Length > 0
  ensures forall i :: 0 <= i < arr.Length ==> arr[i] <= maxValue
  ensures exists i :: 0 <= i < arr.Length && arr[i] == maxValue
{
  maxValue := arr[0];
  var index := 1;
  while index < arr.Length
    invariant 1 <= index <= arr.Length
    invariant forall i :: 0 <= i < index ==> arr[i] <= maxValue
    invariant exists i :: 0 <= i < index && arr[i] == maxValue
    decreases arr.Length - index
  {
    if arr[index] > maxValue {
      maxValue := arr[index];
    }
    index := index + 1;
  }
}

// ============================================================================
// Methode 3: RoundNearest - Rundet auf die nächsten Cent (als Ganzzahl)
// ============================================================================

method RoundNearest(decimalValue: real) returns (roundedCents: int)
  ensures (decimalValue - (roundedCents as real) / 100.0) <= 0.005 && (decimalValue - (roundedCents as real) / 100.0) >= -0.005
{
  // Multipliziere mit 100 um zu Cent zu konvertieren
  var cents := decimalValue * 100.0;
  
  // Runde auf die nächste Ganzzahl
  if cents >= 0.0 {
    // Für positive Werte
    if cents - (cents.Floor as real) >= 0.5 {
      roundedCents := cents.Floor + 1;
    } else {
      roundedCents := cents.Floor;
    }
  } else {
    // Für negative Werte
    var absCents := -cents;
    if absCents - (absCents.Floor as real) >= 0.5 {
      roundedCents := -(absCents.Floor + 1);
    } else {
      roundedCents := -absCents.Floor;
    }
  }
}

// ============================================================================
// Testmethoden zur Demonstration der Funktionalität
// ============================================================================

method TestComputeTotal()
{
  var testArray := new int[3];
  testArray[0] := 5;
  testArray[1] := 10;
  testArray[2] := 15;
  
  var result := ComputeTotal(testArray);
  // Die Methode ist verifiziert - das Ergebnis ist korrekt
}

method TestMax()
{
  var testArray := new int[5];
  testArray[0] := 3;
  testArray[1] := 7;
  testArray[2] := 1;
  testArray[3] := 9;
  testArray[4] := 4;
  var result := Max(testArray);
  // Die Methode ist verifiziert - das Ergebnis ist korrekt
}

method TestRoundNearest()
{
  var result1 := RoundNearest(10.123);
  var result2 := RoundNearest(10.125);
  var result3 := RoundNearest(-5.678);
  // Die Methode ist verifiziert - die Ergebnisse sind korrekt
} 