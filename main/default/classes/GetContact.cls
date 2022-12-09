public class GetContact{

	private Static Final Integer PAGE_NUMBER = 10;
	public List<Contact> records {get; set;}
    public String searchKey {get;set;}
	public GetContact(){ 
		records = [select firstname, lastname, phone FROM Contact];
	maxSize = records.size() ;
	}
	 
	public void search(){
        string searchquery='select firstname, lastname, phone from contact where firstname like \'%'+searchKey+'%\'';
        records= Database.query(searchquery);
    }

 //Keeps track of current page & max size of article list
 Integer currentPage = 1;
 Integer maxSize = 1;
 
 // Returns whether we need to see previous button or not
 public Boolean getPrevRequired() {
  return currentPage > 1;
 }

 // Returns whether we need to see next button or not
 public Boolean getNextRequired() {
  return currentPage * PAGE_NUMBER < maxSize;
 }
 
 //Returns current page number 
 public Decimal getCurrentPageNumber() {
  return this.currentPage;
 }

 //action for next click
 public PageReference next() {
  if(maxSize > this.currentPage * PAGE_NUMBER) {
   this.currentPage = this.currentPage + 1;
  }
  return null;
 }    
 
 //action for previous click
 public PageReference previous() {        
  if(this.currentPage > 1)
   this.currentPage = this.currentPage - 1;
  return null;
 }


}