trigger AccountDeleteonContactDelTrigger on Contact (after delete) {
    List<Account> acc = new List<Account>();
    for (Contact con : Trigger.old){
         acc = [SELECT Id, Name FROM Account WHERE ID = :con.AccountId];
    }
    delete acc;
}