#!/bin/bash

# given a list of words identify words (with length greater than 2) that are 
# palindromic

WORDS=/usr/share/cracklib/cracklib-small
PALINDROMES=()

while read -r word; do
    # ignore words with punctuation or that contain digits
    if ! grep -Eq "[[:punct:]]|[[:digit:]]" <<< "${word}" && [ "${#word}" -gt 2 ]; then
        original="${word}"
        reversed=$(echo "${word}" | rev)
        if [ "${original}" = "${reversed}" ]; then  
            PALINDROMES+=("${original}")
        fi
    fi
done < "${WORDS}"

# write results to a file temporarily to make working with awk a bit easier
for p in "${PALINDROMES[@]}"
do
    echo "${p}" >> palindromes.txt
done

# use awk to determine some statistics on the results
awk '
BEGIN {
    total=0
    longest=""
    longest_len=0
}

{
    len=length($1)
    total+=len
    if (len >= longest_len) {
        longest_len=len
        longest=$1
    }
}

END {
    print "Found " NR " total palindromes"
    print "Average palindrome length: " total/NR
    print "Longest palindrome length: " longest_len
    print "Longest palindrome: " longest
}
' palindromes.txt

# clean up after ourselves
rm palindromes.txt