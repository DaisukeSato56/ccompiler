#! /bin/bash
assert() {
  expected="$1"
  input="$2"

  ./cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  acutual="$?"

  if [ "$acutual" = "$expected" ]; then
    echo "$input => actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 "5+20-4"

echo OK