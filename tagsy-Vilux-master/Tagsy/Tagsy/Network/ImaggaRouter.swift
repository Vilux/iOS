import Alamofire

public enum ImaggaRouter: URLRequestConvertible {
    
    enum Constants {
        static let baseURL = "https://api.imagga.com/v1"
        static let authorizationToken = "Basic YWNjX2RlMWIyOWQ4YTM4MmEyMzozMjBlNjdmMDYxMjMzNWY2ZmFlZjNiNmQ4ZGRiMDAyYg=="
    }
    
    case upload
    case tags(String)
    case colors(String)
    
    var method: HTTPMethod {
        switch self {
        case .upload:
            return .post
        case .tags, .colors:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .upload:
            return "/content"
        case .tags:
            return "/tagging"
        case .colors:
            return "/colors"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .tags(let contentID):
            return ["content": contentID]
        case .colors(let contentID):
            return ["content": contentID, "extract_object_colors": 0]
        default:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Constants.authorizationToken, forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
