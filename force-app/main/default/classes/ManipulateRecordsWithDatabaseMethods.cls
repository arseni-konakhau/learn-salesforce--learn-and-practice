public with sharing class ManipulateRecordsWithDatabaseMethods {
    // public ManipulateRecordsWithDatabaseMethods() {}

    // ManipulateRecordsWithDatabaseMethods.example();
    public static void example() {
        try {
            // ...
        } catch (DmlException e) {
            // ...
        }
    }

    // ManipulateRecordsWithDatabaseMethods.insertRelatedRecords();
    public static void insertRelatedRecords() {
        Account acct = new Account(Name = 'SFDC Account');
        insert acct;
        // Once the account is inserted, the sObject will be
        // populated with an ID.
        // Get this ID.
        ID acctID = acct.ID;
        // Add a contact to this account.
        Contact mario = new Contact(
            FirstName = 'Mario',
            LastName = 'Ruiz',
            Phone = '415.555.1212',
            AccountId = acctID
        );
        insert mario;
    }

    // ManipulateRecordsWithDatabaseMethods.deleteRelatedRecords();
    public static void deleteRelatedRecords() {
        Account[] queriedAccounts = [SELECT Id FROM Account WHERE Name = 'SFDC Account'];
        delete queriedAccounts;
    }

    // ManipulateRecordsWithDatabaseMethods.insertRecordsWithPartialSuccess();
    public static void insertRecordsWithPartialSuccess() {
        // Create a list of contacts
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName = 'Joe', LastName = 'Smith', Department = 'Finance'),
            new Contact(FirstName = 'Kathy', LastName = 'Smith', Department = 'Technology'),
            new Contact(FirstName = 'Caroline', LastName = 'Roth', Department = 'Finance'),
            new Contact()
        };
        // Bulk insert all contacts with one DML call
        Database.SaveResult[] srList = Database.insert(conList, false);
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
            } else {
                // Operation failed, so get all errors
                for (Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Contact fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
}
