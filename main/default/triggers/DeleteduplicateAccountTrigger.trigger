trigger DeleteduplicateAccountTrigger on Account (before insert) {
    List<Account> record = new List<Account>();
    for (Account acc : Trigger.new){
         record = [SELECT Id, Name FROM Account WHERE Name = :acc.Name];
    }
    if (record.size()>0){
        delete record;
    }
}