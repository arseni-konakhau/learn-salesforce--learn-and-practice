import { LightningElement, api, wire } from "lwc";
import getContactsBornAfter from "@salesforce/apex/ContactController.getContactsBornAfter";
import { reduceErrors } from "c/ldsUtils";

export default class WireApexFunction extends LightningElement {
    @api minBirthDate;

    errors;

    @wire(getContactsBornAfter, { birthDate: "$minBirthDate" })
    wiredContacts({ data, error }) {
        if (error) this.errors = reduceErrors(error);
        else console.log(data);
    }
}
