import Foundation

public struct WsClient {
    public let baseUrl: String
    public let urlSession: URLSession
    public let webSocketTask: URLSessionWebSocketTask

    public init(baseUrl: String = "wss://q.trap.jp/api/v3/ws") {
        self.baseUrl = baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("invalid url")
        }

        urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: url)
    }

    public func resume() {
        webSocketTask.resume()
    }

    public func onEvent (type: WsType, completion: @escaping (WsEvent) -> Void) {
        webSocketTask.receive { result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    guard let jsonData = text.data(using: .utf8) else { return }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let event = try decoder.decode(WsEvent.self, from: jsonData)
                        if event.type == type {
                            completion(event)
                        }
                    } catch {
                        print(error)
                    }
                case .data:
                    print("binary body is not supported")
                @unknown default:
                    fatalError("unknown type")
                }

                // run onEvent(type:completion:) recursively
                onEvent(type: type, completion: completion)
            case .failure(let error):
                print(error)
            }
        }
    }
}
