import Flynn
import Foundation
import Picaroon
import Hitch
import Sextant
import Spanker
import PamphletFramework

public class WebUserSession: UserServiceableSession {

    public required init() {
        super.init()
        unsafePriority = 99
    }

    required init(cookieSessionUUID: Hitch?, javascriptSessionUUID: Hitch?) {
        super.init(cookieSessionUUID: cookieSessionUUID, javascriptSessionUUID: javascriptSessionUUID)
        unsafePriority = 99
    }

    public override func safeHandleRequest(connection: AnyConnection,
                                           httpRequest: HttpRequest) {

        let headers: [HalfHitch] = ["Set-Cookie: SESSION_UUID={0}" << [unsafeJavascriptSessionUUID]]

        let payload: Payloadable = httpRequest.supportsGzip ? LD51SitePamphlet.Private.IndexHtml() : LD51SitePamphlet.Private.IndexHtml()

        connection.beSend(httpResponse: HttpResponse(html: payload,
                                                     headers: headers))
    }
}
