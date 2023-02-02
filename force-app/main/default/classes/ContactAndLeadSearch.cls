public with sharing class ContactAndLeadSearch {
    // public ContactAndLeadSearch() {}

    // ContactAndLeadSearch.createSampleData();
    public static void createSampleData() {
        List<Lead> leads = new List<Lead>{
            new Lead(FirstName = 'Smith', LastName = 'Lllll', Title = 'Lllll', Company = 'Lllll'),
            new Lead(FirstName = 'Lllll', LastName = 'Smith', Title = 'Lllll', Company = 'Lllll'),
            new Lead(FirstName = 'Lllll', LastName = 'Lllll', Title = 'Smith', Company = 'Lllll'),
            new Lead(FirstName = 'Lllll', LastName = 'Lllll', Title = 'Lllll', Company = 'Smith'),
            new Lead(FirstName = 'Smith', LastName = 'Smith', Title = 'Smith', Company = 'Smith')
        };
        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName = 'Smith', LastName = 'Ccccc', Title = 'Ccccc', Department = 'Ccccc'),
            new Contact(FirstName = 'Ccccc', LastName = 'Smith', Title = 'Ccccc', Department = 'Ccccc'),
            new Contact(FirstName = 'Ccccc', LastName = 'Ccccc', Title = 'Smith', Department = 'Ccccc'),
            new Contact(FirstName = 'Ccccc', LastName = 'Ccccc', Title = 'Ccccc', Department = 'Smith'),
            new Contact(FirstName = 'Smith', LastName = 'Smith', Title = 'Smith', Department = 'Smith')
        };
        insert leads;
        insert contacts;
    }

    // ContactAndLeadSearch.searchContactsAndLeads('Smith');
    public static List<List<sObject>> searchContactsAndLeads(String input) {
        List<List<sObject>> result = [
            FIND :input
            IN NAME FIELDS
            RETURNING Contact, Lead
        ];
        System.debug('Contact:');
        for (sObject c : result[0]) {
            System.debug(c);
        }
        System.debug('Lead:');
        for (sObject l : result[1]) {
            System.debug(l);
        }
        return result;
    }
}
