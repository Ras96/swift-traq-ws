import Foundation

public struct WsEvent: Decodable {
    public let type: WsType
    public let body: WsPayload

    private enum CodingKeys: CodingKey {
        case type
        case body
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try values.decode(WsType.self, forKey: .type)

        switch self.type {
        case .userJoined:
            self.body = .userJoined(try values.decode(WsPayload.UserJoined.self, forKey: .body))
        case .userUpdated:
            self.body = .userUpdated(try values.decode(WsPayload.UserUpdated.self, forKey: .body))
        case .userTagsUpdated:
            self.body = .userTagsUpdated(try values.decode(WsPayload.UserTagsUpdated.self, forKey: .body))
        case .userIconUpdated:
            self.body = .userIconUpdated(try values.decode(WsPayload.UserIconUpdated.self, forKey: .body))
        case .userWebrtcStateChanged:
            self.body = .userWebrtcStateChanged(try values.decode(WsPayload.UserWebrtcStateChanged.self, forKey: .body))
        case .userViewstateChanged:
            self.body = .userViewstateChanged(try values.decode(WsPayload.UserViewstateChanged.self, forKey: .body))
        case .userOnline:
            self.body = .userOnline(try values.decode(WsPayload.UserOnline.self, forKey: .body))
        case .userOffline:
            self.body = .userOffline(try values.decode(WsPayload.UserOffline.self, forKey: .body))
        case .userGroupCreated:
            self.body = .userGroupCreated(try values.decode(WsPayload.UserGroupCreated.self, forKey: .body))
        case .userGroupUpdated:
            self.body = .userGroupUpdated(try values.decode(WsPayload.UserGroupUpdated.self, forKey: .body))
        case .userGroupDeleted:
            self.body = .userGroupDeleted(try values.decode(WsPayload.UserGroupDeleted.self, forKey: .body))
        case .channelCreated:
            self.body = .channelCreated(try values.decode(WsPayload.ChannelCreated.self, forKey: .body))
        case .channelUpdated:
            self.body = .channelUpdated(try values.decode(WsPayload.ChannelUpdated.self, forKey: .body))
        case .channelDeleted:
            self.body = .channelDeleted(try values.decode(WsPayload.ChannelDeleted.self, forKey: .body))
        case .channelStared:
            self.body = .channelStared(try values.decode(WsPayload.ChannelStared.self, forKey: .body))
        case .channelUnstared:
            self.body = .channelUnstared(try values.decode(WsPayload.ChannelUnstared.self, forKey: .body))
        case .channelViewersChanged:
            self.body = .channelViewersChanged(try values.decode(WsPayload.ChannelViewersChanged.self, forKey: .body))
        case .channelSubscribersChanged:
            self.body = .channelSubscribersChanged(try values.decode(WsPayload.ChannelSubscribersChanged.self, forKey: .body))
        case .messageCreated:
            self.body = .messageCreated(try values.decode(WsPayload.MessageCreated.self, forKey: .body))
        case .messageUpdated:
            self.body = .messageUpdated(try values.decode(WsPayload.MessageUpdated.self, forKey: .body))
        case .messageDeleted:
            self.body = .messageDeleted(try values.decode(WsPayload.MessageDeleted.self, forKey: .body))
        case .messageStamped:
            self.body = .messageStamped(try values.decode(WsPayload.MessageStamped.self, forKey: .body))
        case .messageUnstamped:
            self.body = .messageUnstamped(try values.decode(WsPayload.MessageUnstamped.self, forKey: .body))
        case .messagePinned:
            self.body = .messagePinned(try values.decode(WsPayload.MessagePinned.self, forKey: .body))
        case .messageUnpinned:
            self.body = .messageUnpinned(try values.decode(WsPayload.MessageUnpinned.self, forKey: .body))
        case .messageRead:
            self.body = .messageRead(try values.decode(WsPayload.MessageRead.self, forKey: .body))
        case .stampCreated:
            self.body = .stampCreated(try values.decode(WsPayload.StampCreated.self, forKey: .body))
        case .stampUpdated:
            self.body = .stampUpdated(try values.decode(WsPayload.StampUpdated.self, forKey: .body))
        case .stampDeleted:
            self.body = .stampDeleted(try values.decode(WsPayload.StampDeleted.self, forKey: .body))
        case .stampPaletteCreated:
            self.body = .stampPaletteCreated(try values.decode(WsPayload.StampPaletteCreated.self, forKey: .body))
        case .stampPaletteUpdated:
            self.body = .stampPaletteUpdated(try values.decode(WsPayload.StampPaletteUpdated.self, forKey: .body))
        case .stampPaletteDeleted:
            self.body = .stampPaletteDeleted(try values.decode(WsPayload.StampPaletteDeleted.self, forKey: .body))
        case .clipFolderCreated:
            self.body = .clipFolderCreated(try values.decode(WsPayload.ClipFolderCreated.self, forKey: .body))
        case .clipFolderUpdated:
            self.body = .clipFolderUpdated(try values.decode(WsPayload.ClipFolderUpdated.self, forKey: .body))
        case .clipFolderDeleted:
            self.body = .clipFolderDeleted(try values.decode(WsPayload.ClipFolderDeleted.self, forKey: .body))
        case .clipFolderMessageAdded:
            self.body = .clipFolderMessageAdded(try values.decode(WsPayload.ClipFolderMessageAdded.self, forKey: .body))
        case .clipFolderMessageDeleted:
            self.body = .clipFolderMessageDeleted(try values.decode(WsPayload.ClipFolderMessageDeleted.self, forKey: .body))
        }
    }
}

public enum WsType: String, Decodable {
    // user events
    case userJoined = "USER_JOINED"
    case userUpdated = "USER_UPDATED"
    case userTagsUpdated = "USER_TAGS_UPDATED"
    case userIconUpdated = "USER_ICON_UPDATED"
    case userWebrtcStateChanged = "USER_WEBRTC_STATE_CHANGED"
    case userViewstateChanged = "USER_VIEWSTATE_CHANGED"
    case userOnline = "USER_ONLINE"
    case userOffline = "USER_OFFLINE"
    case userGroupCreated = "USER_GROUP_CREATED"
    case userGroupUpdated = "USER_GROUP_UPDATED"
    case userGroupDeleted = "USER_GROUP_DELETED"

    // channel events
    case channelCreated = "CHANNEL_CREATED"
    case channelUpdated = "CHANNEL_UPDATED"
    case channelDeleted = "CHANNEL_DELETED"
    case channelStared = "CHANNEL_STARED"
    case channelUnstared = "CHANNEL_UNSTARED"
    case channelViewersChanged = "CHANNEL_VIEWERS_CHANGED"
    case channelSubscribersChanged = "CHANNEL_SUBSCRIBERS_CHANGED"

    // message events
    case messageCreated = "MESSAGE_CREATED"
    case messageUpdated = "MESSAGE_UPDATED"
    case messageDeleted = "MESSAGE_DELETED"
    case messageStamped = "MESSAGE_STAMPED"
    case messageUnstamped = "MESSAGE_UNSTAMPED"
    case messagePinned = "MESSAGE_PINNED"
    case messageUnpinned = "MESSAGE_UNPINNED"
    case messageRead = "MESSAGE_READ"

    // stamp events
    case stampCreated = "STAMP_CREATED"
    case stampUpdated = "STAMP_UPDATED"
    case stampDeleted = "STAMP_DELETED"
    case stampPaletteCreated = "STAMP_PALETTE_CREATED"
    case stampPaletteUpdated = "STAMP_PALETTE_UPDATED"
    case stampPaletteDeleted = "STAMP_PALETTE_DELETED"

    // clip events
    case clipFolderCreated = "CLIP_FOLDER_CREATED"
    case clipFolderUpdated = "CLIP_FOLDER_UPDATED"
    case clipFolderDeleted = "CLIP_FOLDER_DELETED"
    case clipFolderMessageAdded = "CLIP_FOLDER_MESSAGE_ADDED"
    case clipFolderMessageDeleted = "CLIP_FOLDER_MESSAGE_DELETED"
}
