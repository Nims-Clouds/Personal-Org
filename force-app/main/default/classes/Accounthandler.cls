public with sharing class Accounthandler {
    public Accounthandler() {

    }
    public static void createcon(List<Account> acc){
        for(Account a :[SELECT Id , Name FROM Account WHERE Id=: acc]){
            Contact con = new Contact();
            con.AccountId = a.Id;
            con.LastName = a.Name;
            insert con;
        }
        
    }

    public static void createac(Account acc){
        List<Account> accounts = new List<Account>(); 
        for(Integer i =0; i< 4000; i++){
            Account ac = new Account(Name = acc.Name);
            accounts.add(ac);
        }
        insert accounts;
    }
    public static void deleteac(List<Account> acc){
        for(Account a : acc){
        if([SELECT Count() FROM Account WHERE Name =:a.Name] != 0){
        Account ad = [SELECT Id FROM Account WHERE Name =:a.Name];
        delete ad;
        }
        }
    }

    public static void Rating(List<Account> acc , List<Account> ac){
        for(Account ao : acc){
            if(ao.Rating!= 'Hot'){
                for(Account ab : ac){
                    if(ab.Rating == 'Hot'){
                        AccountShare a = new AccountShare();
                        a.UserOrGroupID = '0055g00000FwqQ6';
                        a.AccountId = ab.Id;
                        a.AccountaccessLevel = 'Edit';
                        a.OpportunityAccessLevel = 'Read';
                        a.ContactAccessLevel = 'Edit';
                        a.CaseAccessLevel = '';
                        insert a;
                    }
                }
            }
        }
    }
        public static void change(Account neew ,Account old){
            if(neew.Name != old.Name){
                Contact con = [SELECT email FROM Contact WHERE AccountId=: neew.Id];
  
                List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
                List<String> address = new List<String>{};
                address.add(con.email);
                    
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSubject('Your Account name has been change');
                mail.setplaintextbody('Account owner has changed account name');
                mail.setToAddresses(address);
                emailList.add(mail);
                
                if(!emailList.isEmpty()){
                    Messaging.sendEmail(emailList);
                }
            }
            
        }


    public static void approval(List<Account> acc){
        for(Account a : [SELECT Id FROM Account WHERE Id =: acc]){
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            req.setObjectId(a.Id);
            Approval.ProcessResult result = Approval.process(req);
        }
    }

    public static void prefix(List<Account> acc){
        for(Account a :  acc){
        a.Name = 'Mr.'+ a.Name;
        }
    }
    public static void publics(List<Account> acc){
        for(Account ac : acc )
        ac.OwnerId = ac.LastModifiedById;

    }
}