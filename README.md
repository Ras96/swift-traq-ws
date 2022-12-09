# swift-traq-ws

Swift client library for the traQ **Websocket** API.

- for other API: [traPtitech/swift-traq](https://github.com/traPtitech/swift-traq)
- API spec: [traP Swagger Viewer](https://apis.trap.jp/#/notification/ws)

Please install this package by SPM.

## Example

```swift
import TraqWebsocket

// in function...
let wsClient = WsClient()

// register process on specific event
wsClient.onEvent(type: .messageRead) { event in
    // aquire payload struct
    guard case let .messageRead(payload) = event.body else {
        return
    }

    print("receive \(event.type) event: \(payload)")
}

// connect
wsClient.resume()
```
