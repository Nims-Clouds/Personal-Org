public with sharing class TRIAL {
    public TRIAL() {

    }
    public static void trials(List<Contact> con){
        Set<Id> ids = new Set<Id>();
        for(Contact c : con){
            ids.add(c.id);
        }
    }
}
