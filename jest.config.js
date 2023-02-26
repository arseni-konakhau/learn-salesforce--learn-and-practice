const { jestConfig } = require("@salesforce/sfdx-lwc-jest/config");

module.exports = {
    ...jestConfig,
    moduleNameMapper: {
        "^lightning/button$": "<rootDir>/force-app/test/jest-mocks/lightning/button/button",
        "^thunder/hammerButton$": "<rootDir>/force-app/test/jest-mocks/thunder/hammerButton/hammerButton"
    },
    resolver: "<rootDir>/node_modules/@salesforce/sfdx-lwc-jest/src/resolver.js",
    modulePathIgnorePatterns: ["<rootDir>/.localdevserver"]
};
