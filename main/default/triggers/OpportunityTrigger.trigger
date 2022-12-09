trigger OpportunityTrigger on Opportunity (before update) {
    for (opportunity o : Trigger.new){
        o.StageName = 'Prospecting';
        o.CloseDate = System.today().addDays(15);
        o.Type = 'New Customer';
    }
}