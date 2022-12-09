trigger NewAccountApprovalTrigger on Account (after insert) {
    for (Account acc : Trigger.new){
        Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
        req.setComments('Submitting Account Record approval request using Trigger');        
        req.setObjectId(acc.id);        
        Approval.ProcessResult result = Approval.process(req);
    }
}