trigger UnknownContact on Contact (before insert, before update) {
    if(trigger.isBefore){
        system.debug('trigger before event');
        if(trigger.isInsert){            
            
            List<Contact> listOfContact = new List<Contact>();            
            
            for (Contact conObj : trigger.new)   
            {  
                if (String.isBlank(conObj.accountid))   
                {  
                    listOfContact.add(conObj);  
                }  
            }  
            system.debug('listOfContact_1 ' + listOfContact);  
            
            if (listOfContact.size() > 0)
            {  
                List<Account> createNewAcc = new List<Account>();
                Map<String,Contact> conNameKeys = new Map<String,Contact>();
                
                for (Contact con : listOfContact)   
                {  
                    String accountName = con.firstname + ' ' + con.lastname;  
                    conNameKeys.put(accountName,con);                      
                    Account accObj = new Account();  
                    accObj.Name = accountName;
                    accObj.Phone= con.MobilePhone;
                    createNewAcc.add(accObj);  
                }  
                Insert createNewAcc;  
                for (Account acc : createNewAcc)   
                {  
                    system.debug('mapContainsKey ' + conNameKeys.containsKey(acc.Name));
                   
                    if (conNameKeys.containsKey(acc.Name))   
                    {  
                        conNameKeys.get(acc.Name).accountId = acc.Id;  
                    }  
                }  
            } 
        }
    }
    else if(trigger.isAfter){
        system.debug('trigger after event');
    }
}