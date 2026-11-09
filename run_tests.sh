#!/usr/bin/env bash
# 用法：./run_tests.sh [程式檔，預設 sum_to_n.f90]
# 編譯後以三個隨機 N 執行，並與公式 N(N+1)/2 比對。
set -u
SRC="${1:-sum_to_n.f90}"
gfortran -o sum_to_n "$SRC" || { echo "編譯失敗"; exit 1; }
echo "編譯成功：$SRC"
pass=0
for t in 1 2 3; do
  n=$(( RANDOM % 100000 + 1 ))
  expected=$(( n * (n + 1) / 2 ))
  out=$(./sum_to_n "$n")
  actual="${out##*= }"
  if [ "$actual" = "$expected" ]; then r=PASS; pass=$((pass+1)); else r=FAIL; fi
  echo "測試$t: N=$n 程式輸出=[$out] 公式值=$expected => $r"
done
echo "通過 $pass / 3"
[ "$pass" -eq 3 ]
