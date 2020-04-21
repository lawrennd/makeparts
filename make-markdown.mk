
%.slides.pptx.markdown: %.md ${DEPS}
	${PP} $< -o $@ --to pptx --format slides --code sparse ${PPFLAGS} -B ../_includes/talk-notation.tex

%.slides.html.markdown: %.md ${DEPS}
	${PP} $< -o $@ --to html --format slides --code sparse ${PPFLAGS} 

%.notes.html.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format notes --to html --code sparse ${PPFLAGS} 

%.notes.tex.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format notes --to tex --code sparse ${PPFLAGS} 
	# Fix percentage width for latex.
	sed -i -e 's/width=\(.*\)\%/width=0.\1\\textwidth/g' $@
	sed -i -e 's/height=\(.*\)\%/height=0.\1\\textheight/g' $@

%.notes.docx.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format notes --to docx --code sparse ${PPFLAGS} 

%.notes.ipynb.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format notes --to ipynb --code ipynb ${PPFLAGS} 

%.slides.ipynb.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format slides --to ipynb ${PPFLAGS} 

%.plots.py.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format code --to python --code plot ${PPFLAGS} 

%.all.py.markdown: %.md ${DEPS}
	${PP} $< -o $@ --format code --to python --code diagnostic ${PPFLAGS} 
