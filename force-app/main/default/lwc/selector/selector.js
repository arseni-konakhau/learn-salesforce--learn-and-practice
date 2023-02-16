import { LightningElement, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";
import USER_ID from "@salesforce/user/Id";
import USER_NAME from "@salesforce/schema/User.Name";
const fields = [USER_ID, USER_NAME];

export default class Selector extends LightningElement {
    get userId() {
        return USER_ID;
    }

    @wire(getRecord, { recordId: "$userId", fields })
    _user = {};

    get isUserFound() {
        return this._user?.data?.fields;
    }

    get user() {
        const value = this._user?.data.fields || {};
        console.log('value:', value);
        return value;
    }

    get name() {
        return this.user?.Name?.value;
    }

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
}
