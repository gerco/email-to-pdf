#!/bin/bash
set -e

DISABLE_IMAGES="${DISABLE_IMAGES:-false}"

if [ -t 0 ]; then 
	>&2 echo This script must be run with a file or pipe as stdin
fi

# First save stdin (eml format) to a file
#cat > input.eml

# Now convert that file to html
mhonarc -single -rcfile /mhonarc.rc "/vol/$1" > /tmp/input.html

# And finally convert to PDF (disable images to reduce probability of ECONNREFUSED errors)
if [ "$DISABLE_IMAGES" == "true" ]
then
  wkhtmltopdf --no-images /tmp/input.html /tmp/output.pdf >/dev/null
else
  wkhtmltopdf /tmp/input.html /tmp/output.pdf >/dev/null
fi

# Now echo the file to stdout
cat /tmp/output.pdf
