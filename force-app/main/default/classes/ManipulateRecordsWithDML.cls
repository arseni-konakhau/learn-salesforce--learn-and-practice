public with sharing class ManipulateRecordsWithDML {
    // public ManipulateRecordsWithDML() {}

    // ManipulateRecordsWithDML.insertAndUpdateContacts();
    public static void insertAndUpdateContacts() {
        // Create a list of contacts
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName = 'Joe', LastName = 'Smith', Department = 'Finance'),
            new Contact(FirstName = 'Kathy', LastName = 'Smith', Department = 'Technology'),
            new Contact(FirstName = 'Caroline', LastName = 'Roth', Department = 'Finance'),
            new Contact(FirstName = 'Kim', LastName = 'Shain', Department = 'Education')
        };
        insert conList;
        List<Contact> listToUpdate = new List<Contact>();
        for (Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Title = 'Financial analyst';
                listToUpdate.add(con);
            }
        }
        update listToUpdate;
    }

    // ManipulateRecordsWithDML.upsertContacts();
    public static void upsertContacts() {
        Contact josh = new Contact(FirstName = 'Josh', LastName = 'Kaplan', Department = 'Finance');
        insert josh;
        josh.Description = 'Josh\'s record has been updated by the upsert operation.';
        Contact kathy = new Contact(FirstName = 'Kathy', LastName = 'Brown', Department = 'Technology');
        List<Contact> contacts = new List<Contact>{ josh, kathy };
        upsert contacts;
    }

    // ManipulateRecordsWithDML.upsertContactsAlt();
    public static void upsertContactsAlt() {
        List<Contact> result = new List<Contact>();
        List<Contact> updList = [SELECT FirstName, LastName, Department FROM Contact];
        List<Contact> insList = new List<Contact>{
            new Contact(FirstName = '0-Jopa', LastName = '0-Pizdec', Department = 'Finance'),
            new Contact(FirstName = '0-Jopa', LastName = '0-Pizdec', Department = 'Technology')
        };
        result.addAll(updList);
        result.addAll(insList);
        for (Contact variable : result) {
            System.debug(variable);
        }
        upsert result;
    }

    // ManipulateRecordsWithDML.upsertContactsIDLookup();
    public static void upsertContactsIDLookup() {
        Contact jane = new Contact(
            FirstName = 'Jane',
            LastName = 'Smith',
            Email = 'jane.smith@example.com',
            Description = 'Contact of the day'
        );
        upsert jane;
        // 1. Upsert using an idLookup field
        // Create a second sObject variable.
        // This variable doesn’t have any ID set.
        Contact jane2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Smith',
            Email = 'jane.smith@example.com',
            Description = 'Prefers to be contacted by email.'
        );
        upsert jane2;
        // Verify that the contact has been updated
        String description = 'Prefers to be contacted by email.';
        System.assertEquals(description, [SELECT Description FROM Contact WHERE Id = :jane.Id].Description);
    }
}
