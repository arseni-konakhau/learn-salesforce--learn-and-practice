import { LightningElement, api, wire } from "lwc";
import getContactsBornAfter from "@salesforce/apex/ContactController.getContactsBornAfter";
import { reduceErrors } from "c/ldsUtils";

export default class WireApexProperty extends LightningElement {
    @api minBirthDate;

    @wire(getContactsBornAfter, { birthDate: "$minBirthDate" })
    contacts;

    get errors() {
        return this.contacts?.error ? reduceErrors(this.contacts?.error) : [];
    }
}
