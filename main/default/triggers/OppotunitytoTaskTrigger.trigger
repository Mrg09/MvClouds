trigger OppotunitytoTaskTrigger on Opportunity (after update) {
    List<Task> tasks = new List<Task>();
    for (Opportunity opp : Trigger.new){
        if(opp.Name != Trigger.oldmap.get(opp.Id).Name){
            tasks.add(new Task(OwnerId = opp.OwnerId, Subject = 'Test Task', WhatId = opp.Id));
        }
    }
    System.debug(tasks);
    insert tasks;
}