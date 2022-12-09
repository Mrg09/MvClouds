public with sharing class NewContact {

    public Contact c { get; set; }
    
    public NewContact(){
       c=new Contact();
    }

    public PageReference save() {
       insert c;
       return null;
    }


   }