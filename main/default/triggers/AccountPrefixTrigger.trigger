trigger AccountPrefixTrigger on Account (before insert) {
    for (account acc : Trigger.new){
        if (acc.Name != Null || acc.Name != ' '){
        acc.Name = 'Mr.'+acc.Name;
        }
    }
}