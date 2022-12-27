public class All_Task {
    public All_Task() {
    }
    public PageReference Task_1(){
        return Page.StandardContact;
    }
    public PageReference Task_2(){
        return Page.Task_2;
    }
    public PageReference Task_3(){
        return Page.Task_3;
    }
    public PageReference Task_4(){
        return Page.Task_4;
    }
    public PageReference Task_5(){
        return Page.Task_5;
    }
    public PageReference Task_6(){
        return Page.Task_6;
    }
    public PageReference Task_3_additional(){
        return Page.task_3_changes;
    }

    @AuraEnabled
    public static string sendemail(String email, String Subject, String Mail){
        try {   
                HttpRequest req = new HttpRequest();
                System.debug(email+'   '+Subject+'   '+ Mail);
                String mbody = '{ "raw" : "' + EncodingUtil.base64Encode(Blob.valueof( 'To: ' + email + '\r\n Content-Type:text/html; charset=utf-8; \r\nSubject: ' + Subject + '\r\n\r\n' + Mail )) + '"}';
                 req.setHeader('Content-Length', mbody.length()+'');
                req.setHeader('Content-Type', 'application/json');

                req.setEndpoint('callout:Gmail_API/gmail/v1/users/nimitshah099@gmail.com/messages/send?uploadType=media');
                req.setMethod('POST');
                system.debug(mbody);
                req.setBody(mbody);
                Http h = new Http();
                HttpResponse res = h.send(req);
                system.debug(res);
        return null;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
