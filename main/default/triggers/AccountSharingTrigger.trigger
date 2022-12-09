trigger AccountSharingTrigger on Account (after update) {
    AccountShare accs = new AccountShare();
    for (Account acc : Trigger.new){
        if(acc.Rating == 'Hot' && acc.Rating != Trigger.oldmap.get(acc.Id).Rating){
            User VarU = [Select id from user where firstname = 'Charlie'];
            accs.AccountId = acc.Id;
            accs.RowCause = 'Manual';
            accs.UserOrGroupId = VarU.id;
            accs.AccountAccessLevel = 'Read';
            accs.OpportunityAccessLevel = 'Read';
            accs.ContactAccessLevel = 'Read';
            accs.CaseAccessLevel = 'Read';
            insert accs;
        }
    }
}