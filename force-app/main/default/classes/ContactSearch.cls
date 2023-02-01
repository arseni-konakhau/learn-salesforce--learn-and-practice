public with sharing class ContactSearch {
    // public ContactSearch() {}
    public static List<Contact> searchForContacts(String lastname, String postalcode) {
        List<Contact> result = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName = :lastname AND MailingPostalCode = :postalcode
        ];
        return result;
    }
}
