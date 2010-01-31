input metauml;

beginfig(1);

Class.Object("Object")
	("associations: Set<Association>", "properties: Collection<Object>",
	 "value: object_t", "type: Type")
	();

drawObjects(Object);

endfig;
end;
