public class AnC{

    public Contact con {get;set;}   
    public ApexPages.StandardSetController acc{get; set;} 
    public String searchKey {get;set;}
    public AnC()
    {
       con = new Contact();
       lstContact = new List<Contact>();
       
    }
    public List<Contact> lstContact 
    {  
        get  
        {  
            if(acc != null)  
                return (List<Contact>)acc.getRecords();  
            else  
                return null ;  
        }  
        set;
    }  
     
	public void search(){
        string searchquery='select firstname, lastname, phone from contact where firstname like \'%'+searchKey+'%\'';
        acc = new ApexPages.StandardSetController(Database.getQueryLocator(searchquery));
        acc.setPageSize(10);
    }

 //Keeps track of current page & max size of article list
 Integer currentPage = 1;
 Integer maxSize = 1;
 
 // Returns whether we need to see previous button or not
 public Boolean hasNext {
  get  
        {  
            return acc.getHasNext();  
        }  
        set;
 }

 // Returns whether we need to see next button or not
 public Boolean hasPrevious {
   get  
        {  
            return acc.getHasPrevious();  
        }  
        set;
 }
    
 //Returns current page number 
 public Integer pageNumber {
  get  
        {  
            return acc.getPageNumber();  
        }  
        set;  
 }    
    
 //action for next click
 public Void next() {
  acc.next();
 }    
 
 //action for previous click
 public Void previous() {        
   acc.previous();
}
}