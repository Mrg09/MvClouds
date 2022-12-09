public class AccountTriggerHandler {
    List<Contact> con = new List<Contact>();
    List<Account> record = new List<Account>();
    
    //Change Ownershpi of Account Record to Public on Updating Record. 
    public void Ownership(List<Account> acc){
        for (Account a : acc){
        a.Ownership = 'Public';
    	}
    }
    
    //Adds Mr. as Prefix to Account name on insertion of new account record.
    public void NamePrefix(List<Account> acc){
        for (account a : acc){
        	if (a.Name != Null || a.Name != ' '){
        		a.Name = 'Mr.'+a.Name;
        	}
    	}
    }
    
    //Sends new Account record for Approval.
    public void ApprovalRequest(List<Account> acc){
        for (Account a : acc){
        	Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
        	req.setComments('Submitting Account Record approval request using Trigger');        
        	req.setObjectId(a.id);        
        	Approval.ProcessResult result = Approval.process(req);
    	}
    }
    
    //Creates new contact for new account with same name.
    public void NewContact(List<Account> acc){
        for (Account a : acc){
        	con.add(new Contact(FirstName=a.Name,LastName=a.Name,Email='mitrajsinh0911@gmail.com',AccountId=a.Id));
    	}
    	if(con.size()>0){
    		insert con;
    	}
    }
    
    //Deletes duplicate Account record having same name as new inserted record.
    public void DeleteDuplicate(List<Account> acc){
        for (Account a : acc){
            record = [SELECT Id, Name FROM Account WHERE Name = :a.Name];
    	}
    	if (record.size()>0){
    		delete record;
    	}
    }
    
    //Shares Record with another user. 
    public void Sharingrecord(List<Account> acc){
        AccountShare accs = new AccountShare();
    	for (Account a : acc){
        User VarU = [Select id from user where firstname = 'Charlie'];
        accs.AccountId = a.Id;
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