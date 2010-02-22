input metauml;

beginfig(1);

Class.Object("MObject")
	("associations: Set<Association>", "properties: Collection",
	 "value: Object", "type: Type")
	();

Class.Collection("SearchableCollection")
	("-heap: Heap<MObject>")
	("+find(type: Type, association: Association): MObject");

Class.Set("Set")
	("-heap: Heap<T>")
	("+include?(t: T): bool",
	 "+add(t: T)",
	 "+remove(t: T)");

ClassTemplate.T("T")(Set);

Collection.sw = Object.ne + (20, 20);
Set.nw = Object.se + (20, -20);

drawObjects(Object, Collection, Set, T);

link(aggregation)(Object.ne -- Collection.sw);

endfig;
end;
