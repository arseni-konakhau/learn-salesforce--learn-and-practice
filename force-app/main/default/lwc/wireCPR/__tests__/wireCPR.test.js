import { createElement } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import WireCPR from "c/wireCPR";

// Mock realistic data
const mockCurrentPageReference = require("./data/CurrentPageReference.json");

describe("c-wire-c-p-r", () => {
    afterEach(() => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it("renders the current page reference in <pre> tag", () => {
        const element = createElement("c-wire-c-p-r", {
            is: WireCPR
        });
        document.body.appendChild(element);
        // Select element for validation
        const preElement = element.shadowRoot.querySelector("pre");
        expect(preElement).not.toBeNull();
        // Emit data from @wire
        CurrentPageReference.emit(mockCurrentPageReference);
        return Promise.resolve().then(() => {
            expect(preElement.textContent).toBe(JSON.stringify(mockCurrentPageReference, null, 2));
        });
    });
});
