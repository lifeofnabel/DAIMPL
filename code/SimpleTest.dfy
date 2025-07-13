method SimpleMax(seq: seq<int>) returns (maxValue: int)
  requires |seq| > 0
{
  maxValue := seq[0];
  var index := 1;
  while index < |seq|
  {
    if seq[index] > maxValue {
      maxValue := seq[index];
    }
    index := index + 1;
  }
} 