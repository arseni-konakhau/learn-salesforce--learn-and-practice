@isTest
private class AccountWrapper_Tests {

    @testSetup
    static void loadTestData() {
        List<Account> accounts = (List<Account>) Test.loadData(Account.SObjectType, 'accountData');
        List<Opportunity> opps = new List<Opportunity>();
        for (Account a : accounts) {
            opps.addAll(TestFactory.generateOppsForAccount(a.id, 102000.00, 5));
        }
        insert opps;
    }

    @isTest
    static void testPositiveRoundedAveragePrice() {
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for (Account a : [SELECT ID, Name FROM Account]) {
            accounts.add(new AccountWrapper(a));
        }
        List<Opportunity> sanityCheckListOfOpps = [SELECT ID FROM Opportunity];
        System.assert(sanityCheckListOfOpps.size() > 0, 'You need an opportunity to continue');
        Test.startTest();
        for (AccountWrapper a : accounts) {
            Decimal value =  a.getRoundedAvgPriceOfOpps();
            System.assertEquals(value, 102000.00, 'Expected to get 102000.00');
        }
        Test.stopTest();
    }

    @isTest
    static void testIsHighPriority() {
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for (Account a : [SELECT ID, Name FROM Account]) {
            accounts.add(new AccountWrapper(a));
        }
        List<Opportunity> sanityCheckListOfOpps = [SELECT ID FROM Opportunity];
        System.assert(sanityCheckListOfOpps.size() > 0, 'You need an opportunity to continue');
        Test.startTest();
        for (AccountWrapper a : accounts) {
            Boolean value = a.isHighPriority();
            System.assert(value, 'isHighPriority: ' + value);
        }
        Test.stopTest();
    }
}
