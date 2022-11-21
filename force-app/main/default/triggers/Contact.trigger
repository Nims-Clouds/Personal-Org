trigger Contact on Contact (after insert, before update,after delete, before insert) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
        Contacthandler.great_problem(Trigger.new);
        }
        else if(Trigger.isUpdate){
            Contacthandler.update_great(Trigger.new);
        }
    }
    else{
        if(Trigger.isDelete){
            Contacthandler.deleteacc(Trigger.old);
        }
        else{
            Contacthandler.createevent(Trigger.new);
        }
    }



}