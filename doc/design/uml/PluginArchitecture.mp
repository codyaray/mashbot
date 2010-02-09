input metauml;


beginfig(1);

  Interface.D("Service Plugin")(
			"+run(operation:String,contentType:String,MObject content)",
			"+hasRequiredInfo(operation:String,contentType:String,MObject content)",
			"+getRequiredField(operation:String,contentType:String)",
			"+getServiceName()",
			"+getSupported()"
			);

	drawObject(D);
endfig;

beginfig(5);
  save A, B;
  Component.A("Content Processing Handler")();
  Interface.B("Service Plugin")(
			"+run(operation:String,contentType:String,MObject content)",
			"+hasRequiredInfo(operation:String,contentType:String,MObject content)",
			"+getRequiredField(operation:String,contentType:String)",
			"+getServiceName()",
			"+getSupported()"
			);
	Component.C("Plugin Manager")();

  leftToRight(80)(A, B);

	C.n = A.s + (0,-40);

	Package.P("mashbot.Handlers")(A,C);

	Package.Q("mashbot.Plugins")(B);


  drawObjects(P, Q);

  link(providedInterface)( A.e -- .5[A.e, B.w] );
  link(requiredInterface)( B.w -- .5[A.e, B.w] );
endfig;


end;
