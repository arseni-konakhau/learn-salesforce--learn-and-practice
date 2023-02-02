public with sharing class AccountUtility {
    // public AccountUtility() {}

    // AccountUtility.viewAnnualRevenue();
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Id, Name, AnnualRevenue FROM Account];
        for (Account item : accountsList) {
            String acctRev = item.Name + ' : ' + item.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}
