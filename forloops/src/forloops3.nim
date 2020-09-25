let st = "The quick brown fox jumped over the lazy dog"
var count = 0
for ch in st:
    if ch == 'o':
        echo "found one 'o'"
        count += 1
echo "there are "&($count)&" 'o's in the sentence: '"&st&"'"