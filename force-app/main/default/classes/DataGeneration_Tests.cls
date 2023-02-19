@isTest
private class DataGeneration_Tests {
    @testSetup
    static void dataCreation() {
        TestFactory.generateAccountWithContacts(5);
        Account a = TestFactory.getAccount('Muddy Waters Inc.', true);
        Contact c = TestFactory.getContact(a.id, 'Muddy', 'Waters', true);
        Opportunity opp = new Opportunity();
        opp.name = 'Long lost record';
        opp.accountId = a.id;
        opp.closeDate = Date.today().addDays(14);
        opp.stageName = 'prospecting';
        insert opp;
    }

    @isTest
    static void testBruteForceAccountCreation() {
        List<Account> accts = new List<Account>();
        Test.startTest();
        accts = [SELECT Id FROM Account];
        Test.stopTest();
        Integer sz1 = accts.size();
        System.assert(sz1 > 0, sz1 + ' account(s) found');
    }

    @isTest
    static void testUseTestFactoryToCreateAccountsWithContacts() {
        List<Account> accts;
        List<Contact> contacts;
        Test.startTest();
        accts = [SELECT Id FROM Account];
        contacts = [SELECT Id FROM Contact];
        Test.stopTest();
        Integer az = accts.size();
        Integer cz = contacts.size();
        System.assert(az > 0, az + ' account(s) found');
        System.assert(cz == 6, 'Expected: 6 contacts (' + cz + ')');
    }

    @isTest
    static void testAtTestSetupMethodsRule() {
        List<Opportunity> opps = [SELECT Id, AccountId FROM Opportunity];
        System.assertEquals(1, opps.size(), 'Expected test to find a single Opp');
    }
}
