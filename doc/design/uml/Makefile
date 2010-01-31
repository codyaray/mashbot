
all: uml

Handlers:
	mpost object_model.mp

ObjectModel:
	mpost Handlers.mp

uml: Handlers ObjectModel

clean:
	rm -f *.1
	rm -f *.2
	rm -f *.3
	rm -f *.4
	rm -f *.log

pdf:
	mptopdf *.mp
