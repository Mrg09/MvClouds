trigger ContextVariable on Account (after undelete) {
    
    if (Trigger.isExecuting){
        System.debug('isExecuting True');
    }else{
        System.debug('isExecuting False');
    }
    
    if (Trigger.isInsert){
        System.debug('isInsert True');
    }else{
        System.debug('isInsert False');
    }
    
    if (Trigger.isUpdate){
        System.debug('isUpdate True');
    }else{
        System.debug('isUpdate False');
    }
    
    if (Trigger.isDelete){
        System.debug('isDelete True');
    }else{
        System.debug('isDelete False');
    }
    
    if (Trigger.isBefore){
        System.debug('isBefore True');
    }else{
        System.debug('isBefore False');
    }
    
    if (Trigger.isAfter){
        System.debug('isAfter True');
    }else{
        System.debug('isAfter False');
    }
    
    if (Trigger.isUndelete){
        System.debug('isUndelete True');
    }else{
        System.debug('isUndelete False');
    }
    
    for (Account a : Trigger.new){
        System.debug('Trigger.new');
    }
    
    for (Account a : Trigger.old){
        System.debug('Trigger.old');
    }
    
    System.debug(Trigger.operationType);
    System.debug(Trigger.size);
}