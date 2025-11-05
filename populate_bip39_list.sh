#!/bin/bash
# Helper script to populate bip39_list.html with BIP39 words, bits, and symbols formatted for HTML.
# Runs BIP39_list_generator.sh, formats output, and puts 2048 lines before </ul><!--/words--> "anchor".

set -e

HTML_FILE="/workspaces/here/bip39_list.html"
GENERATOR="/workspaces/here/BIP39_list_generator.sh"

# Generate lines
LINES=$(bash "$GENERATOR")

# Format each line as <li> with spans and write to temp file
TMPFILE=$(mktemp)
while IFS= read -r line; do
  idx=$(echo "$line" | awk '{print $1}')
  word=$(echo "$line" | awk '{print $2}')
  bits=$(echo "$line" | awk '{print $3}')
  symbols=$(echo "$line" | awk '{print $4}')
  echo "      <li><span class=\"word\">$word</span> <span class=\"bits\">$bits</span> <span class=\"symbols\">$symbols</span></li>" >> "$TMPFILE"
done <<< "$LINES"

# Insert before </ul><!--/words--> by printing file line by line
OUTFILE="$HTML_FILE.tmp"
while IFS= read -r html_line; do
  if [[ "$html_line" =~ "</ul><!--/words-->" ]]; then
    cat "$TMPFILE" >> "$OUTFILE"
  fi
  echo "$html_line" >> "$OUTFILE"
done < "$HTML_FILE"
mv "$OUTFILE" "$HTML_FILE"
rm "$TMPFILE"

echo "Inserted $(echo "$LINES" | wc -l) lines into $HTML_FILE."