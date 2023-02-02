public with sharing class WriteSOSLQueries {
    // public WriteSOSLQueries() {}

    // WriteSOSLQueries.createSampleData();
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

    // WriteSOSLQueries.runSOSLApexExample();
    public static void runSOSLApexExample(String input) {
        System.debug('======================================================= ' + input);
        List<List<sObject>> searchList = [
            FIND :input
            IN ALL FIELDS
            RETURNING
                Account(
                    Name,
                    BillingCity,
                    BillingState,
                    BillingPostalCode,
                    BillingCountry,
                    ShippingCity,
                    ShippingState,
                    ShippingPostalCode,
                    ShippingCountry,
                    AccountNumber,
                    Sic,
                    TickerSymbol,
                    Site,
                    Jigsaw,
                    JigsawCompanyId,
                    DunsNumber,
                    Tradestyle,
                    NaicsCode,
                    NaicsDesc,
                    YearStarted,
                    SicDesc,
                    SLASerialNumber__c,
                    BillingStreet,
                    ShippingStreet,
                    Description,
                    Type,
                    BillingGeocodeAccuracy,
                    ShippingGeocodeAccuracy,
                    Industry,
                    Ownership,
                    Rating,
                    CleanStatus,
                    AccountSource,
                    CustomerPriority__c,
                    SLA__c,
                    Active__c,
                    UpsellOpportunity__c),
                Contact(
                    Name,
                    LastName,
                    FirstName,
                    OtherCity,
                    OtherState,
                    OtherPostalCode,
                    OtherCountry,
                    MailingCity,
                    MailingState,
                    MailingPostalCode,
                    MailingCountry,
                    Title,
                    Department,
                    AssistantName,
                    EmailBouncedReason,
                    JigsawContactId,
                    Languages__c,
                    OtherStreet,
                    MailingStreet,
                    Description,
                    OtherGeocodeAccuracy,
                    Salutation,
                    MailingGeocodeAccuracy,
                    LeadSource,
                    CleanStatus,
                    Level__c)
        ];
        Account[] searchAccounts = (Account[]) searchList[0];
        Contact[] searchContacts = (Contact[]) searchList[1];
        for (Account a : searchAccounts) {
            System.debug(a);
        }
        for (Contact c : searchContacts) {
            System.debug(c);
        }
    }
}
