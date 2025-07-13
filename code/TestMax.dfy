method Max(seq: seq<int>) returns (maxValue: int)
  requires seq.Length > 0
  ensures forall i | 0 <= i < seq.Length :: seq[i] <= maxValue
  ensures exists i | 0 <= i < seq.Length :: seq[i] == maxValue
{
  maxValue := seq[0];
  var index := 1;
  while index < seq.Length
    invariant 1 <= index <= seq.Length
    invariant forall i | 0 <= i < index :: seq[i] <= maxValue
    invariant exists i | 0 <= i < index :: seq[i] == maxValue
  {
    if seq[index] > maxValue {
      maxValue := seq[index];
    }
    index := index + 1;
  }
} 