@isTest
public class TestforApexBatchClass {
	
    static testMethod void testMethod1() 
    {
        List<Account> lstAccount= new List<Account>();
        for(Integer i=0 ;i <200;i++)
        {
            Account acc = new Account();
            acc.Name ='Name'+i;
            lstAccount.add(acc);
        }
        
        insert lstAccount;
        
        Test.startTest();

            BatchClassAccount obj = new BatchClassAccount();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}