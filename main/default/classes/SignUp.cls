public class SignUp {
    public Contact con{get;set;} //Assume it to be ur custom user
    public string selectedname{get;set;}
    public String emailreg{get;set;}
    public String Emailmessage{get;set;}
    public List<Selectoption> getselectedaccnamefields(){
        List<Selectoption> lstnamesel = new List<selectoption>();
        lstnamesel.add(new selectOption('', '- None -'));
        System.debug('Fist time'+lstnamesel);
        for(Account acc :[SELECT id,name,phone,type,industry FROM Account]){
            lstnamesel.add(new selectoption(acc.id,acc.name));

        }
            System.debug('After Loop-'+lstnamesel);
            return lstnamesel; 
        }
    public SignUp(){
        Emailmessage = '';
        con=new Contact();
     }
    public void Sign()
    {
        emailreg = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$';
        Pattern MyPattern = Pattern.compile(emailreg);
	    Matcher MyMatcher = MyPattern.matcher(con.Email);
        if (MyMatcher.matches()) {
            INSERT con;
            redirect();
            
        } else {
            Emailmessage = '!Enter Valid Email address';
        }
        
}
public Pagereference redirect(){
    PageReference pageRef = new PageReference('https://mvclouds-2d-dev-ed--c.develop.vf.force.com/apex/loginpage?core.apexpages.request.devconsole=1');
            aura.redirect(pageRef);
            return pageRef;    
}
   
}