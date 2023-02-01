public with sharing class GetStartedWithSOQL {
    public GetStartedWithSOQL() {
    }

    // GetStartedWithSOQL.retrieveAccounts();
    public static Account[] retrieveAccounts() {
        Account[] result = [SELECT Name, Phone FROM Account];
        System.debug('RESULT: ' + result);
        return result;
    }

    // GetStartedWithSOQL.prepareExamplesData();
    public static Account[] prepareExamplesData() {
        // Add account and related contact
        Account acct = new Account(
            Name = 'SFDC Computing',
            Phone = '(415)555-1212',
            NumberOfEmployees = 50,
            BillingCity = 'San Francisco'
        );
        insert acct;
        // Once the account is inserted, the sObject will be
        // populated with an ID.
        // Get this ID.
        ID acctID = acct.ID;
        // Add a contact to this account.
        Contact con = new Contact(
            FirstName = 'Carol',
            LastName = 'Ruiz',
            Phone = '(415)555-1212',
            Department = 'Wingo',
            AccountId = acctID
        );
        insert con;
        // Add account with no contact
        Account acct2 = new Account(
            Name = 'The SFDC Query Man',
            Phone = '(310)555-1213',
            NumberOfEmployees = 50,
            BillingCity = 'Los Angeles',
            Description = 'Expert in wing technologies.'
        );
        insert acct2;
    }
}
