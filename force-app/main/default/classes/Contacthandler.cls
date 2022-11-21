public with sharing class Contacthandler {
    public Contacthandler() {

    }
    public static void deleteacc(List<Contact> con){
        for(Contact cont : con){
            if([SELECT Count() FROM Account WHERE Id =: cont.AccountId]!= 0){
                Account Ac = [SELECT Id FROM Account WHERE Id =: cont.AccountId];
                delete Ac;
            }
        }
    }
    public static void createevent(List<Contact> con){
        for(Contact cont : con){
            Event eve = new Event();
            eve.ownerId = cont.ownerId;
            eve.WhoId = cont.Id;
            eve.IsAllDayEvent = true;
            eve.ActivityDate = System.Today();
            eve.Subject = 'Call';
            insert eve;
        }
    }
    public static void sheep(Map<Id,Contact> cold , Map<Id,Contact> cnew){
        List<Contact> con = new List<Contact>();
        for(Contact c: cnew.values()){
            if([SELECT Count() FROM Contact WHERE AccountId =:cold.get(c.Id).AccountId] != 0){
            con = [SELECT Name,AccountId FROM Contact WHERE AccountId =: cold.get(c.Id).AccountId ];
            for(Contact co : con){
                co.AccountId = c.AccountId;
            }
    }
}
update con;     
}

public static void great_problem(List<Contact> contactlist){
    for(Contact con : contactlist){
    Account acc = [SELECT Id, Total_Amount__c FROM Account WHERE Id = : con.AccountId];

    if(con.Amount__c > acc.Total_Amount__c){
        List<Contact> c = new List<Contact>();
        while (con.Amount__c > acc.Total_Amount__c) {
            Contact co = new Contact(LastName = con.LastName,Amount__c = acc.Total_Amount__c, AccountId = con.AccountId);
            c.add(co);
            con.Amount__c -= acc.Total_Amount__c;
        }
        insert c;
    }
}
    // Amount__c	Total_Amount__c
}
public static void update_great(List<Contact> contactlist){

    for(Contact con : contactlist){
        Account acc = [SELECT Id, Total_Amount__c FROM Account WHERE Id = : con.AccountId];
    
        if(con.Amount__c > acc.Total_Amount__c){
            List<Contact> c = new List<Contact>();
            while (con.Amount__c > acc.Total_Amount__c) {
                Contact co = new Contact(LastName = con.LastName,Amount__c = acc.Total_Amount__c, AccountId = con.AccountId);
                c.add(co);
                con.Amount__c -= acc.Total_Amount__c;
            }
            insert c;
        }
    }
        // Amount__c	Total_Amount__c
    }

}     

            

   
