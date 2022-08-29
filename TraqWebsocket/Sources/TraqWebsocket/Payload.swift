import Foundation

public enum WsPayload: Decodable {
    case userJoined(UserJoined)
    case userUpdated(UserUpdated)
    case userTagsUpdated(UserTagsUpdated)
    case userIconUpdated(UserIconUpdated)
    case userWebrtcStateChanged(UserWebrtcStateChanged)
    case userViewstateChanged(UserViewstateChanged)
    case userOnline(UserOnline)
    case userOffline(UserOffline)
    case userGroupCreated(UserGroupCreated)
    case userGroupUpdated(UserGroupUpdated)
    case userGroupDeleted(UserGroupDeleted)
    case channelCreated(ChannelCreated)
    case channelDeleted(ChannelDeleted)
    case channelUpdated(ChannelUpdated)
    case channelStared(ChannelStared)
    case channelUnstared(ChannelUnstared)
    case channelViewersChanged(ChannelViewersChanged)
    case channelSubscribersChanged(ChannelSubscribersChanged)
    case messageCreated(MessageCreated)
    case messageUpdated(MessageUpdated)
    case messageDeleted(MessageDeleted)
    case messageRead(MessageRead)
    case messageStamped(MessageStamped)
    case messageUnstamped(MessageUnstamped)
    case messagePinned(MessagePinned)
    case messageUnpinned(MessageUnpinned)
    case stampCreated(StampCreated)
    case stampUpdated(StampUpdated)
    case stampDeleted(StampDeleted)
    case stampPaletteCreated(StampPaletteCreated)
    case stampPaletteUpdated(StampPaletteUpdated)
    case stampPaletteDeleted(StampPaletteDeleted)
    case clipFolderCreated(ClipFolderCreated)
    case clipFolderUpdated(ClipFolderUpdated)
    case clipFolderDeleted(ClipFolderDeleted)
    case clipFolderMessageAdded(ClipFolderMessageAdded)
    case clipFolderMessageDeleted(ClipFolderMessageDeleted)

    public struct UserJoined: Decodable {

    }

    public struct UserUpdated: Decodable {

    }

    public struct UserTagsUpdated: Decodable {

    }

    public struct UserIconUpdated: Decodable {

    }

    public struct UserWebrtcStateChanged: Decodable {

    }

    public struct UserViewstateChanged: Decodable {

    }

    public struct UserOnline: Decodable {

    }

    public struct UserOffline: Decodable {

    }

    public struct UserGroupCreated: Decodable {

    }

    public struct UserGroupUpdated: Decodable {

    }

    public struct UserGroupDeleted: Decodable {

    }

    public struct ChannelCreated: Decodable {

    }

    public struct ChannelDeleted: Decodable {

    }

    public struct ChannelUpdated: Decodable {

    }

    public struct ChannelStared: Decodable {

    }

    public struct ChannelUnstared: Decodable {

    }

    public struct ChannelViewersChanged: Decodable {

    }

    public struct ChannelSubscribersChanged: Decodable {

    }

    public struct MessageCreated: Decodable {

    }

    public struct MessageUpdated: Decodable {

    }

    public struct MessageDeleted: Decodable {

    }

    public struct MessageRead: Decodable {
    }

    public struct MessageStamped: Decodable {

    }

    public struct MessageUnstamped: Decodable {

    }

    public struct MessagePinned: Decodable {

    }

    public struct MessageUnpinned: Decodable {

    }

    public struct StampCreated: Decodable {

    }

    public struct StampUpdated: Decodable {

    }

    public struct StampDeleted: Decodable {

    }

    public struct StampPaletteCreated: Decodable {

    }

    public struct StampPaletteUpdated: Decodable {

    }

    public struct StampPaletteDeleted: Decodable {

    }

    public struct ClipFolderCreated: Decodable {

    }

    public struct ClipFolderUpdated: Decodable {

    }

    public struct ClipFolderDeleted: Decodable {

    }

    public struct ClipFolderMessageAdded: Decodable {

    }

    public struct ClipFolderMessageDeleted: Decodable {

    }
}
