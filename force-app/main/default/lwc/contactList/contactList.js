import { LightningElement, wire } from "lwc";

import FIRSTN_FIELD from "@salesforce/schema/Contact.FirstName";
import LASTN_FIELD from "@salesforce/schema/Contact.LastName";
import EMAIL_FIELD from "@salesforce/schema/Contact.Email";
import getContacts from "@salesforce/apex/ContactController.getContacts";

import { reduceErrors } from "c/ldsUtils";

const COLUMNS = [
    { label: "First Name", fieldName: FIRSTN_FIELD.fieldApiName, type: "text" },
    { label: "Last Name", fieldName: LASTN_FIELD.fieldApiName, type: "text" },
    { label: "Email", fieldName: EMAIL_FIELD.fieldApiName, type: "email" }
];

export default class AccountList extends LightningElement {
    columns = COLUMNS;
    @wire(getContacts)
    contacts;

    get errors() {
        return this.contacts?.error ? reduceErrors(this.contacts?.error) : [];
    }
}
