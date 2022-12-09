global class BatchOpportunity implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        // collect the batches of records or objects to be passed to execute

        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
       
        // process each batch of records

        List<Opportunity> opp = new List<Opportunity>();
        for(Account acc : accList)
        {        
            // Insert Opportunity for all the Accounts 
            Opportunity opp2 = new Opportunity();
            opp2.Name = 'Opp -'+acc.Name;
            opp2.StageName = 'Prospecting';
            opp2.CloseDate = System.today().addDays(30);
            opp.add(opp2);
        }
        try {
            // Update the Account Record
            insert opp;
        
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
        System.debug('Success');
  }
}