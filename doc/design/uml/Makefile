
all: uml

RequestResponse.?: RequestResponse.mp
	mpost RequestResponse.mp

uml: object_model.? Handlers.? RequestResponse.?

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
	mptopdf RequestResponse.mp
	mptopdf Handlers.mp

.PHONY: all uml clean
