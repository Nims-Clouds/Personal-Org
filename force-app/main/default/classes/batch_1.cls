global class batch_1 implements Database.Batchable<sObject>{
    public List<Account> accountlist = new List<Account>();
   global Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator([SELECT Id, Name FROM Account WHERE Name =: 'Nimit']);
   }
   global void execute(Database.BatchableContext bc, List<Account> acc){
    for(Account a : acc){
        a.Name = 'Nimit';
        accountlist.add(a);
    }
    update acc;
    
   System.debug(accountlist);
   }
   global void finish(Database.BatchableContext bc){
    System.debug(accountlist);
    batch_2 batch = new batch_2(accountlist);
    Id ids = Database.executeBatch(batch,2000);
   }
}
