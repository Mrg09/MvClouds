@isTest
public class TestOpportunityTrigger {
	@isTest static void TestUpdateOpportunity() {
        // Test data setup
        // Create an account with an opportunity,
        Account acct = new Account(Name='Test Account');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                                       StageName='Qualification',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id);
        insert opp;
        // Perform test
        Test.startTest();
        opp.Amount = 100;
        Database.SaveResult result = Database.update(opp, false);
        Test.stopTest();
        // Verify 
        System.Assert(result.isSuccess());
        System.debug('Test1'+result.isSuccess());
    }
    @isTest static void TestUpdateOpportunityBulk(){
        List<Opportunity> opp2 = new List<Opportunity>();
        Account acct = new Account(Name='Test Account');
        insert acct;
        for (integer i=0 ; i<10 ; i++ ){
            Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity'+i,
                                       StageName='Qualification',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id);
            opp2.add(opp);
        }
        insert opp2;
        opp2 = [SELECT StageName, CloseDate, AccountID, Amount from Opportunity];
        System.debug(opp2);
        // Perform Bulk test
        Test.startTest();
        for(Opportunity Op : opp2){
            Op.Amount = 200;
        }
        update opp2;
        Database.SaveResult[] result = Database.update(opp2, false);
        Test.stopTest();
        for (Database.SaveResult res : result){
            System.Assert(res.isSuccess());
            System.debug('Test2'+res.isSuccess());
        }
    }
}