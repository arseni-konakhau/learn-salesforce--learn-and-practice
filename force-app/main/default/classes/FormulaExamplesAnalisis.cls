public with sharing class FormulaExamplesAnalisis {
    // public FormulaExamplesAnalisis() {}
}

// IF(
//     AND (AnnualRevenue > 10000000,
//         CONTAINS (
//             CASE(BillingCountry, "United States", "US", "America", "US", "USA", "US", "NA"),
//         "US")
//     ),
//     IF(
//         ISPICKVAL(Type, "Manufacturing Partner"), "Hot",
//     IF(OR (
//         ISPICKVAL(Type, "Channel Partner/Reseller"),
//         ISPICKVAL(Type, "Installation Partner")
//     ), "Warm", "Cold")),
// "Cold")

// IF(
//     ISBLANK(BillingState), "None",
//     IF(
//         CONTAINS("AK:AZ:CA:HA:NV:NM:OR:UT:WA", BillingState), "West",
//         IF(
//             CONTAINS("CO:ID:MT:KS:OK:TX:WY", BillingState), "Central",
//             IF(
//                 CONTAINS("CT:ME:MA:NH:NY:PA:RI:VT", BillingState), "East",
//                 IF(
//                     CONTAINS("AL:AR:DC:DE:FL:GA:KY:LA:MD:MS:NC:NJ:SC:TN:VA:WV", BillingState), "South",
//                     IF(
//                         CONTAINS("IL:IN:IA:MI:MN:MO:NE:ND:OH:SD:WI", BillingState), "North",
//                             "Other")
//                 )
//             )
//         )
//     )
// )

