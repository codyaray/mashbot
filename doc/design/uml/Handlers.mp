input metauml;

beginfig(1);
	Interface.Handler("Handler")
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");

	drawObject(Handler);

endfig;

beginfig(2);
	Class.ChainableHandler("ChainableHandler")
			()
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");
	drawObject(ChainableHandler);

endfig;

beginfig(3);

endfig;

end;
