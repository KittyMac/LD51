import Flynn
import Picaroon

func handleStaticRequest(config: ServerConfig,
                         httpRequest: HttpRequest) -> HttpResponse? {
    if let url = httpRequest.url {

        if url.contains("private/") {
            return HttpStaticResponse.internalServerError
        } else {

            // Request for HTML are never satisfied by the static resources
            if url.ends(with: ".htm") {
                return HttpStaticResponse.internalServerError
            }

            
            /*
            // We only ever allow script.combined.js to be downloaded, and it is a combination of scripts.
            if url.ends(with: "script.combined.js") {
                if httpRequest.supportsGzip {
                    return HttpResponse(javascript: SextantSitePamphlet.Private.ScriptCombinedJsGzip(),
                                        encoding: HttpEncoding.gzip.rawValue)
                }
                return HttpResponse(javascript: SextantSitePamphlet.Private.ScriptCombinedJs())
            }

            let urlString = url.description
            if let content = SextantSitePamphlet.get(gzip: urlString), httpRequest.supportsGzip {
                return HttpResponse(status: .ok,
                                    type: HttpContentType.fromPath(url),
                                    payload: content,
                                    encoding: HttpEncoding.gzip.rawValue,
                                    cacheMaxAge: cacheMaxAge)
            } else if let content = SextantSitePamphlet.get(data: urlString) {
                return HttpResponse(status: .ok,
                                    type: HttpContentType.fromPath(url),
                                    payload: content,
                                    cacheMaxAge: cacheMaxAge)
            } else if let content = SextantSitePamphlet.get(string: urlString) {
                return HttpResponse(status: .ok,
                                    type: HttpContentType.fromPath(url),
                                    payload: content,
                                    cacheMaxAge: cacheMaxAge)
            }
             */
        }
    }
    return nil
}

public enum LD51Site {

    public static func http(_ address: String,
                            _ httpPort: Int32) {

        Flynn.startup()

        let config = ServerConfig(address: address,
                                  port: Int(httpPort),
                                  requestTimeout: 30.0,
                                  maxRequestInBytes: 1024 * 1024 * 16)

        Server<WebUserSession>(config: config,
                               staticStorageHandler: handleStaticRequest).run()
    }

}
