public class FutureMethodUsage {

    
    public static void insertLead (){
        Lead newLead = new Lead();
        newLead.FirstName = 'Apex Class';
        newLead.LastName = 'G. Absol';
        newLead.Company = 'Comp Any';
        INSERT newLead;
        
        newLead.Description = 'just a description';
        UPDATE newLead;
    }
    
    
    
    
    
    
    
    
}