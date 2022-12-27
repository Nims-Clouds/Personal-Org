@isTest
public with sharing class ftTest {

    @TestSetup
    static void makeData(){
        Person__c p = new Person__c(
            Name = 'Nimit'
        );
        insert p;
        System.debug(p);


        Transaction__c data1 = new Transaction__c(
            Amount__c = 1000,
            Person__c = p.Id,
            Bank__c = True,
            Credit__c = True
        );
        insert data1;
        System.debug(data1);
        Transaction__c data2 = new Transaction__c(
            Amount__c = 1000,
            Person__c = p.Id,
            Bank__c = True,
            Debit__c = True
        );
        insert data2;

        Transaction__c data3 = new Transaction__c(
            Amount__c = 1000,
            Person__c = p.Id,
            Cash__c = True,
            Credit__c = True
        );
        insert data3;
        
        Transaction__c data4 = new Transaction__c(
            Amount__c = 1000,
            Person__c = p.Id,
            Cash__c = True,
            Debit__c = True
        );
        insert data4;
        
    }

    @isTest static void testtransactions(){ 
        Person__c p = [SELECT Id FROM Person__c];
        ft.transactions(p.Id);
    }

    @isTest static void testTotalAmount(){ 
        Person__c p = [SELECT Id FROM Person__c];
        ft.TotalAmount(p.Id);
    }

    @isTest static void testsaveamount(){ 
        Person__c p = [SELECT Id FROM Person__c];
        ft.saveamount(p.Id);
        ft.saveamount(null);
    }
}
