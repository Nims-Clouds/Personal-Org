@isTest
public with sharing class TestBatch_1 {
    @isTest static void test(){
        List<Account> acc = new List<Account>();
        for(Integer i = 0; i < 20; i++){
            acc.add(new Account(Name = 'Nimit'));
        }
        insert acc;
       batch_1 batch = new batch_1();
       Database.executeBatch(batch);
       List<Account> ac = [SELECT Name FROM Account WHERE Name =: 'NimitBatchupdate'];
       System.assertEquals(20, ac.size());
    }
}
