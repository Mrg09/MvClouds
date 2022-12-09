trigger AccountTrigger on Account (before insert, before update, after update, after insert) {
    
    AccountTriggerHandler AccHandler = new AccountTriggerHandler();
    
    if (Trigger.isInsert && Trigger.isBefore){
        AccHandler.NamePrefix(Trigger.new);
        AccHandler.DeleteDuplicate(Trigger.new);
    }
    
    if (Trigger.isInsert && Trigger.isAfter){
        AccHandler.ApprovalRequest(Trigger.new);
        AccHandler.NewContact(Trigger.new);
    }
    
    if (Trigger.isUpdate && Trigger.isBefore){
        AccHandler.Ownership(Trigger.new);
    }
    
    if (Trigger.isUpdate && Trigger.isAfter){
        for (Account acc : Trigger.new){
            if(acc.Rating == 'Hot' && acc.Rating != Trigger.oldmap.get(acc.Id).Rating){
                AccHandler.Sharingrecord(Trigger.new);
            }
        }
    }
}