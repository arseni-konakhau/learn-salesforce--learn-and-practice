import { LightningElement, api, wire } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { getRecord } from "lightning/uiRecordApi";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";

export default class WireCPR extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: "$recordId", fields: [ACCOUNT_NAME_FIELD] })
    wiredRecord;

    @wire(CurrentPageReference)
    pageRef;

    get currentPageRef() {
        return this.pageRef ? JSON.stringify(this.pageRef, null, 2) : "";
    }
}
