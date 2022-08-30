import Foundation

public struct WsClient {
    public let webSocketTask: URLSessionWebSocketTask

    public init(webSocketTask: URLSessionWebSocketTask) {
        self.webSocketTask = webSocketTask
    }

    public init(
        baseUrl: String = "wss://q.trap.jp/api/v3/ws",
        urlSession: URLSession = .init(configuration: .default)
    ) {
        guard let url = URL(string: baseUrl) else {
            fatalError("invalid url")
        }

        webSocketTask = urlSession.webSocketTask(with: url)
    }

    public func resume() {
        webSocketTask.resume()
    }

    public struct ErrorInvalidJSON: Error {}

    public func onEvents(completion: @escaping (WsEvent) -> Void) {
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
                        completion(event)
                    } catch {
                        print(error)
                    }
                case .data:
                    print("binary body is not supported")
                @unknown default:
                    fatalError("unknown type")
                }

                // run onEvents(completion:) recursively
                onEvents(completion: completion)
            case .failure(let error):
                print(error)
            }
        }
    }

    public func onEvent (type: WsType, completion: @escaping (WsEvent) -> Void) {
        onEvents { event in
            if event.type == type {
                completion(event)
            }
        }
    }

    public func receiveEvent() async throws -> WsEvent {
        let message = try await webSocketTask.receive()
        guard case let .string(text) = message else {
            throw ErrorInvalidJSON()
        }

        guard let jsonData = text.data(using: .utf8) else {
            throw ErrorInvalidJSON()
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let event = try decoder.decode(WsEvent.self, from: jsonData)
        return event
    }
}
