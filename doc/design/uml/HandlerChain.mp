input metauml;

beginfig(1);
	Class.A("HandlerChain")
			("First: Handler")
			("+start(in:Request,out:Response,context:RequestContext)");


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
	A.s = G.n + (0,60);



	Package.P("mashbot.Handlers")(HandlerClass);
	
	drawObject(P);
	drawObject(A);

	link(realization)(G.s -- H.n);
	link(inheritance)(H.s -- I.n);
	link(inheritance)(H.s -- J.n);
	link(inheritance)(H.s -- K.n);
	link(inheritance)(H.s -- L.n);
	link(composition)(A.s -- G.n);
	

endfig;

beginfig(2);
	Class.B("HandlerChain")
			("First: Handler")
			("+start(in:Request,out:Response,context:RequestContext)");

	drawObject(B);

endfig;

end;

