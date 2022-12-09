trigger TheGreatProblemTrigger on Contact (before insert,before update) {
    Account acc = new Account();
    Integer Count = 0;
    Integer num = 1;
    Decimal rem = 0;
    List<Contact> contacts = new List<Contact>();
    for (Contact con : Trigger.new){
        acc = [SELECT id, Max_Amount__c from Account where id = :con.AccountId];
        rem = con.Amount__c;
        if (con.Amount__c > acc.Max_Amount__c){
            con.Amount__c = acc.Max_Amount__c;
            rem = rem - acc.Max_Amount__c;
            while (count==0){
                if (rem < acc.Max_Amount__c){
                    count = 1;
                    break;
                }
                rem = rem - acc.Max_Amount__c;
                Contact con0=new Contact(LastName=con.LastName+' - '+num, AccountId =acc.Id, Amount__c=acc.Max_Amount__c);
                contacts.add(con0);
                num=num+1;
            }
            Contact con0=new Contact(LastName=con.LastName+' - '+num, AccountId =acc.Id, Amount__c=rem);
            contacts.add(con0);
        }
        insert contacts;
    }
}