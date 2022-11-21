public with sharing class Opportunityhandler {
    public Opportunity opp;
    public Opportunity op;

    public Opportunityhandler() {

    }
    public static void changeStage(List<Opportunity> opp){
        for(Opportunity op: opp){
            if(op.StageName != 'Prospecting'){
                op.StageName = 'Prospecting';
                }
        }
    }
    public static void changedate(List<Opportunity > opp){
        for(Opportunity op : opp){
        Date d = op.CloseDate;
        op.CloseDate =  d.addDays(15);
        }
    }
    public static void changetypeup(List<Opportunity> opp){
        for(Opportunity op : opp){
            Opportunity opUp = [SELECT Id , Type FROM Opportunity WHERE Id =: op.Id];

            if(opUp.Type!= 'New Customer'){
                opUp.Type ='New Customer';
                update opUp;
        }
    }
}
    public static void changetypein(List<Opportunity> opp){
        for(Opportunity op : opp){
        Opportunity opUp = [SELECT Id FROM Opportunity WHERE Id =: op.Id];
        opUp.Type ='New Customer';
        update opUp;
        }
    }
    public static void createtask(Opportunity oppo , Opportunity oppn){
       System.debug(oppn.Name);
        if(oppo.Name != oppn.Name){
            Task t = new Task();
            t.WhatID          = Oppn.Id;
            t.Ownerid         = oppn.Ownerid;
            t.subject 	  = 'This is the Subject';
            t.Status	  = 'In Progress';
            t.Description     = 'This is the Description';
            insert t;
    }
}
}
