public with sharing class ContactController {
    // public ContactController() {}

    @AuraEnabled
    public static String getContactsBornAfter() {
        try {
            return '';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT Id, FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}
