public class SalesforceLightningWizardController {
    @AuraEnabled
    public static string save(Account accountData ,Contact contactData,Event eventData){
        try{
            System.debug('accountData::::'+accountData);
            System.debug('contactData::::'+contactData);
            System.debug('eventData::::'+eventData);
            
            insert accountData;
            contactData.AccountId = accountData.id;
            insert contactData;
            eventData.WhoId = contactData.id;
            eventData.Subject = 'Wizard Task';
            eventData.StartDateTime = eventData.EndDateTime;
            insert eventData;
        }
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }
}