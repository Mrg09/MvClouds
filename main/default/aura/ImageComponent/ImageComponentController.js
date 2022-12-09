({
	Display : function(component, event, helper){
		var Image = component.get("v.showData");
		component.set("v.showData", true);
		var imgurl = component.get("v.imgurl");
		var newAtt = {"src":imgurl};
		component.find("imgDiv").set("v.HTMLAttributes",newAtt);
	}
})