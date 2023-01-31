public with sharing class ManipulateRecordsWithDML {
    // public ManipulateRecordsWithDML() {}

    // ManipulateRecordsWithDML.bulkContacts();
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
}
