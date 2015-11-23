# email-to-pdf

Docker container to convert emails to PDF

## How?

This container first converts the file specified on the command line (expected to be located in /vol/) to HTML using MhonArc 
and then converts the HTML file to PDF using wkhtmltopdf. The resulting PDF file is streamed to stdout to prevent the container
from needed any permissions on the host/volume file system other than to read the input file.

## Usage

    docker run --rm -v `pwd`:/vol gerco/email-to-pdf input.eml > output.pdf
    
    
