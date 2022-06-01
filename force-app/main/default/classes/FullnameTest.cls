@isTest
public with sharing class FullnameTest {
    @isTest
    public static void TestUnitOne() {

        Lead lead = new Lead();
        lead.FirstName = 'joHn';
        lead.LastName = 'dummY';
        lead.Phone = '1231231212';
        lead.Company = 'Salesforce Academy';
        lead.Salutation = 'Mr.';


        INSERT lead;

        List<Lead> leadList = [SELECT id, Full_Name__c FROM Lead where FirstName = 'joHn' AND LastName ='dummY' ];
        System.debug(leadList.get(0).Full_Name__c);
        System.assertEquals('John Dummy', leadList.get(0).Full_Name__c, 'Fullname does not match');
    }
}
