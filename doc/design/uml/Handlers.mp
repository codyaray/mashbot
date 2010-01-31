input metauml;

beginfig(1);
	Interface.Handler("Handler")
			("+enact(in:Request,out:Response,context:RequestContext)",
			"+preRequest(in:Request,out:Response,context:RequestContext)",
			"+postRequest(in:Request,out:Response,context:RequestContext)");

	AbstractClass.ChainableHandler("ChainableHandler")
			()
			();

	drawObject(Handler);
	drawObject(ChainableHandler);
endfig;
end;
