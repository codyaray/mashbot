
all: uml

Handlers:
	mpost Handlers.mp

ObjectModel:
	mpost object_model.mp

RequestResponse:
	mpost RequestResponse.mp

uml: Handlers ObjectModel RequestResponse

clean:
	rm -f *.1
	rm -f *.2
	rm -f *.3
	rm -f *.4
	rm -f *.log

pdf:
	mptopdf RequestResponse.mp
	mptopdf Handlers.mp
