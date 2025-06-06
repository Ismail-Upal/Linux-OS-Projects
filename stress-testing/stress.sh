#!/bin/bash

g++ gen.cpp -o gen || exit 1
g++ a.cpp -o a || exit 1
g++ brute.cpp -o brute || exit 1

i=1
max=1000

while [ $i -le $max ]; do
    echo "Running test $i..."
    
    ./gen $i > input.txt
    ./a < input.txt > output_a.txt
    ./brute < input.txt > output_b.txt

    if ! diff -w output_a.txt output_b.txt > /dev/null; then
        echo "[FAIL] Mismatch found at test $i!"
        echo
        echo "Input:"
        cat input.txt
        echo
        echo "Your output:"
        cat output_a.txt
        echo 
        echo "Expected output:"
        cat output_b.txt
        echo
        break
    else
        echo "Test $i passed"
    fi 

    ((i++))
done

rm -f gen a brute input.txt output_a.txt output_b.txt


# chmod +x stress.sh
# ./stress.sh