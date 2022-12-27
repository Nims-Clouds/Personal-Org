public with sharing class ft {
    @AuraEnabled
    public static List<Transaction__c> transactions(String recordid){
        try {
            System.debug(recordid);
            List<Transaction__c> data = [SELECT Name,Amount__c,Date__c,Transaction_method__c FROM Transaction__c WHERE Person__c =: recordid];
            System.debug(data);
            return data;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
