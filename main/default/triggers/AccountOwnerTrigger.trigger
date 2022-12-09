trigger AccountOwnerTrigger on Account (before update) {
    for (account a : Trigger.new){
        a.Ownership = 'Public';
    }
}