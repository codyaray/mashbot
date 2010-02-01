input metauml;

beginfig(1);
	Interface.A("Handler")
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");

	drawObject(A);

endfig;

beginfig(2);
	Class.B("ChainableHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(B);

endfig;

beginfig(3);
	Interface.C("Handler")
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");

	Class.D("ChainableHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	
	Class.E("AuthenticationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	
	Class.F("DeserializationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	
	Class.G("RequiredDataVerificationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	
	Class.H("ContentProcessingHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	
	Group.HandlerClass(C,D,E,F,G,H);

	leftToRight(50)(E,F,G,H);
	C.s = (0,0);
	D.n = C.s + (0,-50);
	F.ne = D.s + (-25,-75);

	drawObject(HandlerClass);

	link(realization)(C.s -- D.n);
	link(inheritance)(D.s -- E.n);
	link(inheritance)(D.s -- F.n);
	link(inheritance)(D.s -- G.n);
	link(inheritance)(D.s -- H.n);

	
endfig;

end;
