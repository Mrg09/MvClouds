public class Login {
public Contact con{get;set;} //Assume it to be ur custom user
public String email {get;set;}
public String password {get;set;}
public String AccName{get;set;}
public String emailreg{get;set;}
public Integer Test{get;set;}
public String Emailmessage{get;set;}
    	
public void Login()
{	
    Emailmessage = '';
    System.debug('Current Email'+email);
    System.debug('Current Password'+password);
    emailreg = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$';
    Pattern MyPattern = Pattern.compile(emailreg);
	  Matcher MyMatcher = MyPattern.matcher(email);
    if (MyMatcher.matches()) {
      List<Contact> con = [select ID, Email, lastname, password__c, AccountId from Contact WHERE Email LIKE :email];
      if (con.isEmpty()) {
        Test = 0;
        System.debug('0 run');
        log(Test,con);
          
      } else {
        if (con.get(0).password__c == password) {
            Test = 1;  
            System.debug('1 run');
            log(Test,con);
        } else {
            Test = 2;
            System.debug('2 run');
            log(Test,con);
        }
      }  
    }
    else {
      Emailmessage = '!Enter Valid Email address';
    }
	}
  
  public Pagereference log(Integer Test, List<Contact> con){
    if (Test == 0) {
        PageReference p = new PageReference('https://mitrajsinhgohil-dev-ed--c.develop.vf.force.com/apex/error404?core.apexpages.request.devconsole=1');
        p.setRedirect(true);
        return p;
    } else {
      if (Test == 1) {
        PageReference p = new PageReference('https://mitrajsinhgohil-dev-ed--c.develop.vf.force.com/apex/Dashboard?core.apexpages.request.devconsole=1&AccName='+con.get(0).AccountId);
            p.setRedirect(true);
            return p;
      } else {
        PageReference p = new PageReference('https://mitrajsinhgohil-dev-ed--c.develop.vf.force.com/apex/loginpage?core.apexpages.request.devconsole=1');
            p.setRedirect(true);
            return p; 
      }
      
    }
  }
}