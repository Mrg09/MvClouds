trigger NewEventforNewContactTrigger on Contact (after insert) {
    List<Event> events = new List<Event>();
    for (Contact con : Trigger.new){
        events.add(new Event(Subject = 'Email',StartDateTime = Date.today()+10, EndDateTime = Date.today()+12, OwnerId = con.OwnerId, WhoId = con.Id));
    }
    System.debug(events);
    insert events;
}