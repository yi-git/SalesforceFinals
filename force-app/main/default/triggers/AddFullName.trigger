trigger AddFullName on Lead (before insert, before update) {

    for(Lead lead : Trigger.new){
        String Firstname = lead.FirstName;
        String Lastname = lead.LastName;
        String Fullname = Firstname.toLowerCase().capitalize() + ' ' +Lastname.toLowerCase().capitalize();
        
       lead.Full_Name__c = Fullname;  
        	
        
        
    }
    
}