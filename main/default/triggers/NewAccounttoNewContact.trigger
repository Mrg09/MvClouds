trigger NewAccounttoNewContact on Account (After insert) {
    List<Contact> con = new List<Contact>();
    for (Account acc : Trigger.new){
        con.add(new Contact(FirstName=acc.Name,LastName=acc.Name,Email='mitrajsinh0911@gmail.com',AccountId=acc.Id));
    }
    if(con.size()>0){
        insert con;
    }
}