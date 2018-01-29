#!/bin/bash

cp index.md index_PDF.md

sed -i -e "s/copyOp.PNG)/copyOp.PNG){height=60%}/g" index_PDF.md
sed -i -e "s/DNoverloadable.PNG)/DNoverloadable.PNG){height=60%}/g" index_PDF.md
sed -i -e "s/moveOp.PNG)/moveOp.PNG){height=60%}/g" index_PDF.md
sed -i -e "s/syntax.PNG)/syntax.PNG){height=60%}/g" index_PDF.md

pandoc assets/templates/header.md  index_PDF.md -o assets/documents/index.pdf --template assets/templates/eisvogel.tex --listings --pdf-engine=xelatex

rm -f LectureNotes_PDF.md