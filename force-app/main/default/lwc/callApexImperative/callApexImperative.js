import { LightningElement, api } from "lwc";
import getContactsBornAfter from "@salesforce/apex/ContactController.getContactsBornAfter";

export default class CallApexImperative extends LightningElement {
    @api minBirthDate;
    handleButtonClick() {
        getContactsBornAfter({
            //imperative Apex call
            birthDate: this.minBirthDate
        })
            .then((contacts) => {
                console.log(contacts);
                //code to execute if related contacts are returned successfully
            })
            .catch((error) => {
                console.log(error);
                //code to execute if related contacts are not returned successfully
            });
    }
}
