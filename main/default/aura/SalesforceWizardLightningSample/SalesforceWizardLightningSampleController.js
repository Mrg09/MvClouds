({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        
        
        if(showAccount == true){
            var accountName = component.find("Name").get("v.value");
            console.log('accountName:::'+accountName);
            if(accountName =='' || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showContact",false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", true);
                component.set("v.showEvent", false); 
                component.set("v.showError", false);
            }
        }    
        if(showContact == true){
            var lastName = component.find("LastName").get("v.value");
            console.log('lastName:::'+lastName);
            if(lastName =='' || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showEvent", true);
                component.set("v.showError", false);
            }
        }   
        
        if(showEvent == true){
            var EventName = component.find("EventName").get("v.value");
            console.log('EventName:::'+EventName);
            var StageName = component.find("StageName").get("v.value");
            console.log('StageName:::'+StageName);
            var closeDate = component.find("closeDate").get("v.value");
            console.log('closeDate:::'+closeDate);
            if((EventName =='' || EventName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showError", true);
                
            }
            else
            { 
                component.set("v.showEvent", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false)
                component.set("v.showError", false);
            }
        }   
        
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        
        
        if(showContact == true){
            component.set("v.showAccount", true);
            component.set("v.showContact", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
        }    
        if(showEvent == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", true);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
        } 
    },
    
    onSelectChange : function(component, event, helper) {
        var selected = component.find("StageName").get("v.value");
        component.set("v.EventData.StageName",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },
    
    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    }
})