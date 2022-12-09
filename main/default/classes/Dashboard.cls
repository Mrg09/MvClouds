public class Dashboard {
    public Integer size{get;set;}
    public Integer noOfrecords1{get;set;}
    public Integer noOfrecords2{get;set;}
    public String AccName{get;set;}
    public Contact contact {get;set;}
    public Opportunity opportunity {get;set;}
    public ApexPages.StandardSetController con{get; set;}    
    public ApexPages.StandardSetController opp{get; set;}
    public Dashboard(){
        size = 10;
        contact = new Contact();
        lstContact = new List<Contact>();
        opportunity = new Opportunity();
        lstOpportunity = new List<Opportunity>();
        String AccName = Apexpages.currentPage().getParameters().get('AccName');
        System.debug(AccName);
        con = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT FirstName, phone, LastName, Email, password__c FROM Contact WHERE AccountId = :AccName]));
        System.debug(con);
        con.setPageSize(size);
        noOfRecords1 = con.getResultSize();
        opp = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, Amount, StageName FROM Opportunity WHERE AccountId = :AccName]));
        opp.setPageSize(size);
        noOfRecords1 = opp.getResultSize();
        System.debug(opp);
    }
    public List<Contact> lstContact 
    {  
        get  
        {  
            if(con != null)  
                return (List<Contact>)con.getRecords();  
            else  
                return null ;  
        }  
        set;
    }
    public List<Opportunity> lstOpportunity 
    {  
        get  
        {  
            if(opp != null)  
                return (List<Opportunity>)opp.getRecords();  
            else  
                return null ;  
        }  
        set;
    }
    

//Keeps track of current page & max size of article list
Integer currentPage1 = 1;
Integer currentPage2 = 1;
Integer maxSize1 = 1;
Integer maxSize2 = 1;

//Contact
public Boolean hasNext1 {
 get  
       {  
           return con.getHasNext();  
       }  
       set;
}

// Returns whether we need to see next button or not
public Boolean hasPrevious1 {
  get  
       {  
           return con.getHasPrevious();  
       }  
       set;
}
   
//Returns current page number 
public Integer pageNumber1 {
 get  
       {  
           return con.getPageNumber();  
       }  
       set;  
}    
   
//action for next click
public Void next1() {
 con.next();
}    

//action for previous click
public Void previous1() {        
  con.previous();
}

//Opportunity
public Boolean hasNext2 {
    get  
          {  
              return opp.getHasNext();  
          }  
          set;
   }
   
   // Returns whether we need to see next button or not
   public Boolean hasPrevious2 {
     get  
          {  
              return opp.getHasPrevious();  
          }  
          set;
   }
      
   //Returns current page number 
   public Integer pageNumber2 {
    get  
          {  
              return opp.getPageNumber();  
          }  
          set;  
   }    
      
   //action for next click
   public Void next2() {
     opp.next();
   }    
   
   //action for previous click
   public Void previous2() {        
     opp.previous();
   }
}