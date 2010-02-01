
all: uml

uml: object_model.? Handlers.?

object_model.? : object_model.mp
	mpost object_model.mp

Handlers.? : Handlers.mp
	mpost Handlers.mp

clean:
	rm -f *.1
	rm -f *.2
	rm -f *.3
	rm -f *.4
	rm -f *.log

pdf:
	mptopdf *.mp

.PHONY: all uml clean