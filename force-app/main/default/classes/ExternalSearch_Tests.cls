@isTest
private class ExternalSearch_Tests {

    @isTest
    static void test_method_one() {
        HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        system.assertEquals('I found it!', result, 'something went wrong');
    }

    @isTest
    static void test_method_negative() {
        HttpMockFactory mock = new HttpMockFactory(500, 'ERROR', 'Server is NOT AVAILABLE', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        Boolean excpt = false;
        try {
            result = ExternalSearch.googleIt('epic search');
        } catch (ExternalSearch.ExternalSearchException e) {
            // if (e.getMessage().equalsIgnoreCase('Did not recieve a 200 status code: ....' + ...)) {}
            excpt = true;
        }
        Test.stopTest();
        system.assert(excpt, 'something went wrong with negative HTTP test');
    }

}
