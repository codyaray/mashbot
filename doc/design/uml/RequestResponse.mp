input metauml;

beginfig(1);
	Interface.A("Request")
		("+getOperation()","+getAuthInfo()","+getThirdPartyAuth()","+getContent()",
			"+setOperation(in:String)","+getAuthInfo(in:AuthInfo)","+getThirdPartyAuth(in:ThirdPartyAuth)","+setContent(in:Content)");

	drawObject(A);
endfig;

beginfig(2);
	Interface.B("Response")
			("+yoBitchContent()","+setContent(in:Content)");

	drawObject(B);
endfig;

end;
