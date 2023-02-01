public with sharing class WriteSOSLQueries {
    // public WriteSOSLQueries() {}
    // ----------------------------------------------------------------------
    // WriteSOSLQueries.createSampleData()
    public static void createSampleData() {
        Account acct = new Account(
            Name = 'SFDC Computing',
            Phone = '(415)555-1212',
            NumberOfEmployees = 50,
            BillingCity = 'San Francisco'
        );
        insert acct;
        ID acctID = acct.ID;
        Contact con = new Contact(
            FirstName = 'Carol',
            LastName = 'Ruiz',
            Phone = '(415)555-1212',
            Department = 'Wingo',
            AccountId = acctID
        );
        insert con;
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
