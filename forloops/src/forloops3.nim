let s = "The quick brown fox jumped over the lazy dog"
var count = 0

for ch in s:
    if ch == 'o':
        count += 1

echo "there are ", count, " 'o's in the sentence: '", s, "'"
