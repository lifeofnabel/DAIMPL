# MyLib.dfy - Eine verifizierte Dafny-Bibliothek

Diese Bibliothek enthält drei einfache, aber formal verifizierte Methoden, die mit Dafny bewiesen wurden.

## Methoden

### 1. ComputeTotal
**Zweck:** Summiert alle nicht-negativen Zahlen in einem Array.

**Signatur:**
```dafny
method ComputeTotal(arr: array<int>) returns (total: int)
```

**Voraussetzungen:**
- Das Array darf nicht null sein
- Alle Elemente müssen nicht-negativ sein (≥ 0)

**Nachbedingungen:**
- Das Ergebnis ist immer nicht-negativ
- Das Ergebnis entspricht der mathematischen Summe aller Array-Elemente

**Schleifeninvariante:**
- Der Index bleibt innerhalb der Array-Grenzen
- Die Zwischensumme ist immer nicht-negativ
- Die Zwischensumme entspricht der Summe aller bisher verarbeiteten Elemente

### 2. Max
**Zweck:** Findet das größte Element in einer Sequenz.

**Signatur:**
```dafny
method Max(seq: seq<int>) returns (maxValue: int)
```

**Voraussetzungen:**
- Die Sequenz muss mindestens ein Element enthalten

**Nachbedingungen:**
- Das Ergebnis ist größer oder gleich allen Elementen der Sequenz
- Das Ergebnis kommt mindestens einmal in der Sequenz vor

**Schleifeninvariante:**
- Der Index bleibt innerhalb der Sequenz-Grenzen
- Der aktuelle Max-Wert ist größer oder gleich allen bisher verarbeiteten Elementen
- Der aktuelle Max-Wert kommt mindestens einmal unter den bisher verarbeiteten Elementen vor

### 3. RoundNearest
**Zweck:** Rundet einen Dezimalwert auf die nächsten Cent (als Ganzzahl).

**Signatur:**
```dafny
method RoundNearest(decimalValue: real) returns (roundedCents: int)
```

**Nachbedingungen:**
- Das gerundete Ergebnis weicht höchstens 0,5 Cent vom Original ab
- Mathematisch: |decimalValue - (roundedCents / 100.0)| ≤ 0.005

**Funktionsweise:**
- Konvertiert den Dezimalwert zu Cent (Multiplikation mit 100)
- Rundet auf die nächste Ganzzahl
- Behandelt positive und negative Werte korrekt

## Verwendung

```dafny
// Beispiel für ComputeTotal
var arr := new int[3];
arr[0] := 5; arr[1] := 10; arr[2] := 15;
var sum := ComputeTotal(arr);  // Ergebnis: 30

// Beispiel für Max
var seq := [3, 7, 1, 9, 4];
var maximum := Max(seq);  // Ergebnis: 9

// Beispiel für RoundNearest
var cents := RoundNearest(12.345);  // Ergebnis: 1235 (12.35€)
```

## Verifikation

Alle Methoden sind mit Dafny verifiziert und enthalten:
- **Voraussetzungen (requires):** Bedingungen, die vor der Ausführung erfüllt sein müssen
- **Nachbedingungen (ensures):** Garantien über das Ergebnis nach der Ausführung
- **Schleifeninvarianten:** Eigenschaften, die während der Schleifenausführung erhalten bleiben

## Testen

Die Datei `main.dfy` enthält Testmethoden für alle drei Funktionen. Führen Sie Dafny aus, um die Verifikation zu überprüfen:

```bash
dafny verify MyLib.dfy
dafny verify main.dfy
```

## Anforderungen

- Dafny Compiler/Verifier
- Alle Methoden sind formal bewiesen und korrekt implementiert
