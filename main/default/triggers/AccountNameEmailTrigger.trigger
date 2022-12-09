trigger AccountNameEmailTrigger on Account (after update) {
    List<Contact> con = [select id, Email, FirstName from contact where Accountid in : Trigger.newmap.Keyset()];
    System.debug(con);
    //get all email in the list
    List<Messaging.SingleEmailMessage> mails = 
      
    new List<Messaging.SingleEmailMessage>();
  
    for (Contact myContact : con) {
        System.debug(myContact);
        if (myContact.Email != null) {
    
        // Step 1: Create a new Email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
      
        // Step 2: Set list of people who should get the email
        List<String> sendTo = new List<String>();
        sendTo.add(myContact.Email);
        mail.setToAddresses(sendTo);

        // Step 3. Set email contents - you can use variables!
        mail.setSubject('Your Account Name has been Updated'); //Subject of the mail and the body of the mail
        String body = 'Dear ' + myContact.FirstName + ', '; 
        body += 'According to the AccountNameEmailTrigger trigger';
        body += 'your Account Name has been Updated successfully';
        body += 'Thank You.';
        mail.setHtmlBody(body);
    
        // Step 4. Add your email to the master list
        mails.add(mail);
        }
    }
    // Step 5: Send all emails in the master list
    Messaging.sendEmail(mails);
}