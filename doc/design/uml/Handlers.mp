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
	Class.C("AuthenticationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(C);

endfig;

beginfig(4);
	Class.D("SerializationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(D);

endfig;

beginfig(5);
	Class.E("RequiredDataVerificationHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(E);

endfig;

beginfig(6);
	Class.F("ContentProcessingHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(F);

endfig;

beginfig(7);
	Interface.G("Handler")
			();

	Class.H("ChainableHandler")
			()
			();
	
	Class.I("AuthenticationHandler")
			()
			();
	
	Class.J("SerializationHandler")
			()
			();
	
	Class.K("RequiredDataVerificationHandler")
			()
			();
	
	Class.L("ContentProcessingHandler")
			()
			();
	
	Group.HandlerClass(G,H,I,J,K,L);

	leftToRight(10)(I,J,K,L);
	G.s = (0,0);
	H.n = G.s + (0,-40);
	J.ne = H.s + (-5,-40);



	Package.P("mashbot.Handlers")(HandlerClass);
	
	drawObject(P);

	link(realization)(G.s -- H.n);
	link(inheritance)(H.s -- I.n);
	link(inheritance)(H.s -- J.n);
	link(inheritance)(H.s -- K.n);
	link(inheritance)(H.s -- L.n);
	
endfig;

end;
