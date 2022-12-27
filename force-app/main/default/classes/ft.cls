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

    @AuraEnabled
    public static List<Decimal> TotalAmount(String recordid){
        try {
            Decimal Amount = 0;
            Decimal CreditAmount = 0;
            Decimal DebitAmount = 0;
            List<Decimal> values = new List<Decimal>();

            List<Transaction__c> creditdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Debit__c =: False];
            List<Transaction__c> debitdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Debit__c =: True];
           
            // Amount credited by person
            for(Transaction__c Trans : creditdata){
                CreditAmount += Trans.Amount__c;
            }
            values.add(CreditAmount);

            // Amount Debited from person
            for(Transaction__c Trans : debitdata){
                DebitAmount += Trans.Amount__c;
            }
            values.add(DebitAmount);

            // Total Amount remaining after removing debited amount from credited amount 
            Amount = CreditAmount - DebitAmount;
            values.add(Amount);
            
            return values;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Decimal> saveamount(String recordid){
        try {

            Decimal CashData = 0;
            Decimal BankData = 0; 
            List<Decimal> values = new List<Decimal>();

            // Cash Data
            List<Transaction__c> creditcashdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Credit__c =: True AND Cash__c =: True];
            List<Transaction__c> debitcashdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Debit__c =: True AND Cash__c =: True];
           
            for(Transaction__c credit : creditcashdata){
                CashData += credit.Amount__c;
            }
             
            for(Transaction__c debit : debitcashdata){
                CashData -= debit.Amount__c;
            }
            values.add(CashData);
            System.debug(CashData);

            // Bank Data
            List<Transaction__c> creditbankdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Credit__c =: True AND Bank__c =: True];
            List<Transaction__c> debitbankdata = [SELECT Amount__c FROM Transaction__c WHERE Person__c =: recordid AND Debit__c =: True AND Bank__c =: True];
           
            for(Transaction__c credit : creditbankdata){
                BankData += credit.Amount__c;
            }
             
            for(Transaction__c debit : debitbankdata){
                BankData -= debit.Amount__c;
            }
            values.add(BankData);
            System.debug(BankData);

            return values;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
