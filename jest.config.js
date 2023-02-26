const { jestConfig } = require("@salesforce/sfdx-lwc-jest/config");

module.exports = {
    ...jestConfig,
    moduleNameMapper: {
        "^thunder/hammerButton$": "<rootDir>/force-app/test/jest-mocks/thunder/hammerButton/hammerButton",
        "^lightning/button$": "<rootDir>/force-app/test/jest-mocks/lightning/button/button",
        "^c/displayPanel$": "<rootDir>/force-app/test/jest-mocks/c/displayPanel/displayPanel"
    },
    resolver: "<rootDir>/node_modules/@salesforce/sfdx-lwc-jest/src/resolver.js",
    modulePathIgnorePatterns: ["<rootDir>/.localdevserver"]
};
