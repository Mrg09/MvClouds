public class DragDropController {
    @AuraEnabled
    public list<contact> con1;
    
    //get Account Name Picklist Values
    @AuraEnabled public static Map<String, String> getName(){
        Map<String, String> NameMap = new Map<String, String>();
        //get Account Name Field Describe
        list<Account> acc = [SELECT Name,id from account];
       
        //get Account Name Picklist Values
        for (Account acc2: acc){
            //Put Picklist Value & Label in Map
            NameMap.put(acc2.id, acc2.Name);
        }
        return NameMap;
    }
    
    
    @AuraEnabled public static list<Contact> getcon1(String Aname1){
     	list<contact> li1 = new list<contact>();
		li1 = [Select id,lastname from Contact where Accountid = :Aname1];	
     	return li1;
     }

    @AuraEnabled public static list<Contact> getcon2(String Aname2){
        list<contact> li2 = new list<contact>();
       li2 = [Select id,lastname from Contact where Accountid = :Aname2];	
        return li2;
    }

    @AuraEnabled public static String ChangeAcc(String NAname, String Cname){
        list<contact> con1 = new list<contact>();
        System.debug('Account Id = '+NAname);
        System.debug('Contact Id = '+Cname);
        con1 = [SELECT Id, LastName, AccountId FROM Contact where Id = :Cname];
        System.debug('Contacts'+con1);
        for (contact cons : con1){
            cons.AccountId = NAname;
        }
        update con1;
        System.debug(con1);
        String a = 'Success';
        return a;
    }
}