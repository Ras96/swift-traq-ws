import Foundation

public enum WsPayload: Decodable {
    // user events
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

    // channel events
    case channelCreated(ChannelCreated)
    case channelUpdated(ChannelUpdated)
    case channelDeleted(ChannelDeleted)
    case channelStared(ChannelStared)
    case channelUnstared(ChannelUnstared)
    case channelViewersChanged(ChannelViewersChanged)
    case channelSubscribersChanged(ChannelSubscribersChanged)

    // message events
    case messageCreated(MessageCreated)
    case messageUpdated(MessageUpdated)
    case messageDeleted(MessageDeleted)
    case messageStamped(MessageStamped)
    case messageUnstamped(MessageUnstamped)
    case messagePinned(MessagePinned)
    case messageUnpinned(MessageUnpinned)
    case messageRead(MessageRead)

    // stamp events
    case stampCreated(StampCreated)
    case stampUpdated(StampUpdated)
    case stampDeleted(StampDeleted)
    case stampPaletteCreated(StampPaletteCreated)
    case stampPaletteUpdated(StampPaletteUpdated)
    case stampPaletteDeleted(StampPaletteDeleted)

    // clip events
    case clipFolderCreated(ClipFolderCreated)
    case clipFolderUpdated(ClipFolderUpdated)
    case clipFolderDeleted(ClipFolderDeleted)
    case clipFolderMessageAdded(ClipFolderMessageAdded)
    case clipFolderMessageDeleted(ClipFolderMessageDeleted)

    // user payloads

    public struct UserJoined: Decodable {
        /** 登録されたユーザーのId */
        public let id: UUID
    }

    public struct UserUpdated: Decodable {
        /** 情報が更新されたユーザーのId */
        public let id: UUID
    }

    public struct UserTagsUpdated: Decodable {
        /** タグが更新されたユーザーのId */
        public let id: UUID
        /** 更新されたタグのId */
        public let tagId: UUID
    }

    public struct UserIconUpdated: Decodable {
        /** アイコンが更新されたユーザーのId */
        public let id: UUID
    }

    public struct UserWebrtcStateChanged: Decodable {
        /** 変更があったユーザーのId */
        public let userId: UUID
        /** ユーザーの変更後の接続チャンネルのId */
        public let channelId: UUID
        /** ユーザーの変更後の状態 */
        public let sessions: [Session]

        public struct Session: Decodable {
            /** 状態 */
            public let state: String
            /** セッションID */
            public let sessionId: UUID
        }
    }

    public struct UserViewstateChanged: Decodable {
        /** 変化したWSセッションを含めた、該当ユーザーの変更後の状態 */
        public let viewStates: [ViewState]

        public struct ViewState: Decodable {
            /** WSセッションの識別子 */
            public let key: String
            /** 閲覧しているチャンネルId */
            public let channelId: UUID
            /** 閲覧状態 */
            public let state: ChannelViewState
        }
    }

    public struct UserOnline: Decodable {
        /** オンラインになったユーザーのId */
        public let id: UUID
    }

    public struct UserOffline: Decodable {
        /** オフラインになったユーザーのId */
        public let id: UUID
    }

    public struct UserGroupCreated: Decodable {
        /** 作成されたユーザーグループのId */
        public let id: UUID
    }

    public struct UserGroupUpdated: Decodable {
        /** 作成されたユーザーグループのId */
        public let id: UUID
    }

    public struct UserGroupDeleted: Decodable {
        /** 削除されたユーザーグループのId */
        public let id: UUID
    }

    // channel payloads

    // common channel view state
    public enum ChannelViewState: String, Decodable {
        /** バックグランド表示中 */
        case _none = "none"
        /** メッセージ表示中 */
        case monitoring
        /** メッセージ入力中 */
        case editing
    }

    public struct ChannelCreated: Decodable {
        /** 作成されたチャンネルのId */
        public let id: UUID
        /** (DMの場合のみ */
        public let dmUserId: UUID?
    }

    public struct ChannelUpdated: Decodable {
        /** 変更があったチャンネルのId */
        public let id: UUID
        /** (DMの場合のみ */
        public let dmUserId: UUID?
    }

    public struct ChannelDeleted: Decodable {
        /** 削除されたチャンネルのId */
        public let id: UUID
        /** (DMの場合のみ */
        public let dmUserId: UUID?
    }

    public struct ChannelStared: Decodable {
        /** スターしたチャンネルのId */
        public let id: UUID
    }

    public struct ChannelUnstared: Decodable {
        /** スターしたチャンネルのId */
        public let id: UUID
    }

    public struct ChannelViewersChanged: Decodable {
        /** 変化したチャンネルのId */
        public let id: UUID
        /** 変化後の閲覧者 */
        public let viewers: [Viewer]

        public struct Viewer: Decodable {
            /** ユーザーId */
            public let userId: UUID
            /** 閲覧状態 */
            public let state: ChannelViewState
            /** 閲覧状態の更新日時 */
            public let updateAt: Date
        }
    }

    public struct ChannelSubscribersChanged: Decodable {
        /** 変化したチャンネルのId */
        public let id: UUID
    }

    // message payloads

    public struct MessageCreated: Decodable {
        /** 投稿されたメッセージのId */
        public let id: UUID
        /** 投稿されたメッセージがWebSocketを接続しているユーザーの投稿を引用しているかどうか */
        public let isCiting: Bool
    }

    public struct MessageUpdated: Decodable {
        /** 更新されたメッセージのId */
        public let id: UUID
    }

    public struct MessageDeleted: Decodable {
        /** 削除されたメッセージのId */
        public let id: UUID
    }

    public struct MessageStamped: Decodable {
        /** メッセージId */
        public let messageId: UUID
        /** スタンプを押したユーザーのId */
        public let userId: UUID
        /** スタンプのId */
        public let stampId: UUID
        /** そのユーザーが押した数 */
        public let count: Int
        /** そのユーザーがそのスタンプをそのメッセージに最初に押した日時 */
        public let createdAt: Date
    }

    public struct MessageUnstamped: Decodable {
        /** メッセージId */
        public let messageId: UUID
        /** スタンプを押したユーザーのId */
        public let userId: UUID
        /** スタンプのId */
        public let stampId: UUID
    }

    public struct MessagePinned: Decodable {
        /** ピンされたメッセージのID */
        public let messageId: UUID
        /** ピンされたメッセージのチャンネルID */
        public let channelId: UUID
    }

    public struct MessageUnpinned: Decodable {
        /** ピンが外されたメッセージのID */
        public let messageId: UUID
        /** ピンが外されたメッセージのチャンネルID */
        public let channelId: UUID
    }

    public struct MessageRead: Decodable {
        /** 読んだチャンネルId */
        public let id: UUID
    }

    // stamp payloads

    public struct StampCreated: Decodable {
        /** 作成されたスタンプのId */
        public let id: UUID
    }

    public struct StampUpdated: Decodable {
        /** 修正されたスタンプのId */
        public let id: UUID
    }

    public struct StampDeleted: Decodable {
        /** 削除されたスタンプのId */
        public let id: UUID
    }

    public struct StampPaletteCreated: Decodable {
        /** 作成されたスタンプパレットのId */
        public let id: UUID
    }

    public struct StampPaletteUpdated: Decodable {
        /** 修正されたスタンプパレットのId */
        public let id: UUID
    }

    public struct StampPaletteDeleted: Decodable {
        /** 削除されたスタンプパレットのId */
        public let id: UUID
    }

    // clip payloads

    public struct ClipFolderCreated: Decodable {
        /** 作成されたクリップフォルダーのId */
        public let id: UUID
    }

    public struct ClipFolderUpdated: Decodable {
        /** 更新されたクリップフォルダーのId */
        public let id: UUID
    }

    public struct ClipFolderDeleted: Decodable {
        /** 削除されたクリップフォルダーのId */
        public let id: UUID
    }

    public struct ClipFolderMessageAdded: Decodable {
        /** メッセージが除外されたクリップフォルダーのId */
        public let folderId: UUID
        /** クリップフォルダーから除外されたメッセージのId */
        public let messageId: UUID
    }

    public struct ClipFolderMessageDeleted: Decodable {
        /** メッセージが追加されたクリップフォルダーのId */
        public let folderId: UUID
        /** クリップフォルダーに追加されたメッセージのId */
        public let messageId: UUID
    }
}
