resume.pdf: src/resume.typ src/lib.typ src/work.yaml src/edu.yaml src/pub.yaml
	typst compile $< $@
