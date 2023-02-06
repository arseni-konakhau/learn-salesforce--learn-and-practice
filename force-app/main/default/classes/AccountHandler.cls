public with sharing class AccountHandler {
    // public AccountHandler() {}

    // // AccountHandler.insertNewAccount();
    // public static Account insertNewAccount(String name) {
    //     if (String.isBlank(name)) {
    //         return null;
    //     } else {
    //         try {
    //             Account account = new Account(Name = name);
    //             insert account;
    //             return account;
    //         } catch (DmlException e) {
    //             String message = e.getMessage();
    //             System.debug('A DML exception has occurred: ' + message);
    //             return null;
    //         }
    //     }
    // }

    // AccountHandler.insertAccount(3);
    public static void insertAccount(Integer input) {
        List<Account> addAccounts = new List<Account>();
        for (Integer i = 0; i < input; i++) {
            Account a = new Account();
            a.Name = 'Acme Inc ' + i;
            a.AccountNumber = 'A000' + i;
            addAccounts.add(a);
        }
        insert addAccounts;
    }
}

// Database.SaveResult[] result = Database.insert(input, true);
// for (Database.SaveResult item : result) {
//     if (item.isSuccess()) {
//         System.debug('Successfully inserted contact. Contact ID: ' + item.getId());
//         return
//     } else {
//         for (Database.Error err : item.getErrors()) {
//             System.debug('The following error has occurred.');
//             System.debug(err.getStatusCode() + ': ' + err.getMessage());
//             System.debug('Contact fields that affected this error: ' + err.getFields());
//         }
//     }
// }

