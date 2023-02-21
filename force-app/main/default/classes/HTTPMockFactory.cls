@isTest
public class HTTPMockFactory implements HttpCalloutMock {
    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> headers;

    public HTTPMockFactory(Integer code, String status, String body, Map<String, String> headers) {
        this.code = code;
        this.body = body;
        this.status = status;
        this.headers = headers; // response headers
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        for (String key : this.headers.keySet()) {
            res.setHeader(key, this.headers.get(key));
        }
        res.setBody(this.body);
        res.setStatusCode(this.code);
        res.setStatus(this.status);
        return res;
    }
}
