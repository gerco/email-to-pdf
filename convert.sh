#!/bin/bash
set -e

if [ -t 0 ]; then 
	>&2 echo This script must be run with a file or pipe as stdin
fi

# First save stdin (eml format) to a file
#cat > input.eml

# Now convert that file to html
mhonarc -single -rcfile /mhonarc.rc /vol/$1 > /tmp/input.html

# And finally convert to PDF
wkhtmltopdf /tmp/input.html /tmp/output.pdf >/dev/null

# Now echo the file to stdout
cat /tmp/output.pdf
