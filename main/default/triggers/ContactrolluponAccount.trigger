trigger ContactrolluponAccount on Contact (after insert,after update, after delete) {
    List<Contact> conrecord = new List<Contact>();
    Account acc = new Account();
    if (Trigger.isInsert || Trigger.isUpdate ){
        for (Contact con : Trigger.new){
            conrecord = [SELECT Id, Amount__c From Contact Where AccountId = :con.AccountId];
            System.debug(conrecord);
            acc = [SELECT Id, Total_Amount2__c From Account Where Id = :con.AccountId];
            System.debug(acc);
            acc.Total_Amount2__c = 0;
        }
        for (Contact con2 : conrecord){
            acc.Total_Amount2__c = acc.Total_Amount2__c + con2.Amount__c;
            System.debug(acc.Total_Amount2__c);
        }
        update acc;
    }
    
    if (Trigger.isDelete){
        for (Contact con : Trigger.old){
            conrecord = [Select id, Amount__c from Contact where AccountId = :con.AccountId];
            System.debug(conrecord);
            acc = [SELECT Id, Total_Amount2__c From Account Where Id = :con.AccountId];
            System.debug(acc);
            acc.Total_Amount2__c = 0;
        }
        for (Contact con2 : conrecord){
            acc.Total_Amount2__c = acc.Total_Amount2__c + con2.Amount__c;
            System.debug(acc.Total_Amount2__c);
        }
        update acc;
    }
}