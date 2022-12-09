trigger LeadTrigger on Lead (before insert) {
    for (lead l : Trigger.new){
        l.Rating = 'Hot';
    }
}