trigger Account on Account (before update,after update,before insert,after insert) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            // AccountHandler.publics(Trigger.new);//done
        }
        else if(Trigger.isInsert){
            
            // AccountHandler.deleteac(Trigger.new);//done
            // AccountHandler.prefix(Trigger.new);// done
            
        }
    }
    else{
        if(Trigger.isUpdate){
            // AccountHandler.Rating(Trigger.old, Trigger.new);//done
            // for(Integer i =0 ; i < Trigger.new.size(); i++){
            // AccountHandler.change(Trigger.new[i], Trigger.old[i]);
            // }
            Accounthandler.createac(Trigger.new[0]);
        }
        else if (Trigger.isInsert){
            // AccountHandler.approval(Trigger.new);//done
            // AccountHandler.createcon(Trigger.new);//done
            

        }

    }
}