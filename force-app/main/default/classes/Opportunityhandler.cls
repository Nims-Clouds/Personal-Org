public with sharing class Opportunityhandler {
    public Opportunity opp;
    public Opportunity op;

    public Opportunityhandler() {

    }
    public static void invoke(Opportunity op){
        future(op.Id);
    }
    @future (callout = true)
    public static void future(Id ids){
        // HttpRequest req = new HttpRequest();
        // req.setEndpoint('https://api.unsplash.com/photos/?client_id=7buh_DQcbfeESCH7k4N_P1nHQ_hQ1FhGCR9iM4Fd7lY');
        // req.setMethod('GET');
        // Http http = new Http();
        // HTTPResponse res =  new HTTPResponse();
        // res=http.send(req);
        // System.debug(JSON.Serialize(res.getbody()));

        // String textfile = 'Hey';
        // ContentVersion cVersion = new ContentVersion();
        // cVersion.ContentLocation = 'S'; 
        // cVersion.PathOnClient = 'nimit.jpg';
        // Blob textdata = Blob.valueof('https://images.unsplash.com/photo-1661961111247-e218f67d1cd2?crop=entropy\u0026cs=tinysrgb\u0026fit=max\u0026fm=jpg\u0026ixid=MnwzODI4NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTE4Njg2MA\u0026ixlib=rb-4.0.3\u0026q=80\u0026w=400');
        // System.debug(textdata);
        // cVersion.VersionData = textdata;
        // Insert cVersion;
String TestImageUrl='https://api.unsplash.com/photos/?client_id=7buh_DQcbfeESCH7k4N_P1nHQ_hQ1FhGCR9iM4Fd7lY';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(TestImageUrl);
        req.setMethod('GET');
      
        
        Http binding = new Http();
        HttpResponse response = binding.send(req);
        String base64 = EncodingUtil.base64Encode(response.getBodyAsBlob());
        base64  = EncodingUtil.urlDecode(base64, 'UTF-8');
        Blob testData = Blob.valueOf(base64);
        //String Image = 'response.getBodyAsBlob()';
        System.debug(testdata);

        ContentVersion cv = new ContentVersion();
        cv.ContentLocation ='S';
        cv.Title = 'Test Image'; 
        cv.PathOnClient ='Technology-Logo-Final-03.jpg'; 
      //  Blob testData = Blob.valueOf(base64);
      cv.VersionData = EncodingUtil.base64Decode(base64);

        // cv.VersionData = response.getBodyAsBlob();
        insert cv;
 
        Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
 
        ContentDocumentLink cDocLink = new ContentDocumentLink();
        cDocLink.ContentDocumentId = conDocument;
        cDocLink.LinkedEntityId = ids;
        cDocLink.ShareType='V';
        cDocLink.Visibility='AllUsers';
        Insert cDocLink;
        
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
