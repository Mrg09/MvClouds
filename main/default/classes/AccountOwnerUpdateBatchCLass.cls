global class AccountOwnerUpdateBatchCLass implements Database.Batchable<sObject>, Database.Stateful {
    
    global Integer Count = 0;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name,OwnerId FROM Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        User VarU = [Select id from user where firstname = 'Mitrajsinh'];
        System.debug(VarU);
        for(Account acc : accList)
        {   System.debug('Old Id:-'+acc.OwnerId);
            acc.OwnerId = VarU.Id;
            Count = Count + 1;
            System.debug('New Id:-'+acc.OwnerID);
        }
        try {
            update accList;
        
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        System.debug(Count+'Records Processed');
        AsyncApexJob job = [SELECT Id,Status,NumberOfErrors,JobItemsProcessed,TotalJobItems,CreatedBy.Email From AsyncApexJob WHERE id=:BC.getJobId()];  
        
        User VarU = [Select id,Email,FirstName from user where firstname = 'Mitrajsinh'];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // Step 2: Set list of people who should get the email
        List<String> sendTo = new List<String>();
        sendTo.add(VarU.Email);
        mail.setToAddresses(sendTo);

        // Step 3. Set email contents - you can use variables!
        mail.setSubject('Your have '+Count+' New Account Records'); //Subject of the mail and the body of the mail
        String body = 'Dear ' + VarU.FirstName + ', '; 
        body += 'your have recieved new Account under you';
        body += count +' Accounts Added Successfully.';
        body += 'Thank You.';
        mail.setHtmlBody(body);
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        mails.add(mail);
    
        // Step 4. Add your email to the master list
	    Messaging.sendEmail(mails);
  }
}