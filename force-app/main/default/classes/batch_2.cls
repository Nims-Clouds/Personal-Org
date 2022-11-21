global class batch_2 implements Database.Batchable<sObject>{
    global List<Account> acc = new List<Account>();
    global List<Opportunity> oplist = new List<Opportunity>();
    global batch_2(List<Account> ac) {
        acc = ac;
        System.debug(acc);
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        return  Database.getQueryLocator([SELECT Name FROM Account WHERE Id =: acc]);
    }
    global void execute(Database.BatchableContext bc, List<Account> accounts){
        for(Account ac : accounts){
            Opportunity op = new Opportunity(Name = 'opp'+''+ ac.Name, AccountId = ac.Id);
            oplist.add(op);
        }
        insert oplist;

    }
    global void finish(Database.BatchableContext bc){
        System.debug('Finish debug 2');


    }
}
