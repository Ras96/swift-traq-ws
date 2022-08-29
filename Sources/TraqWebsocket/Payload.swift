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
        let id: UUID
    }

    public struct UserUpdated: Decodable {
        /** 情報が更新されたユーザーのId */
        let id: UUID
    }

    public struct UserTagsUpdated: Decodable {
        /** タグが更新されたユーザーのId */
        let id: UUID
        /** 更新されたタグのId */
        let tagId: UUID
    }

    public struct UserIconUpdated: Decodable {
        /** アイコンが更新されたユーザーのId */
        let id: UUID
    }

    public struct UserWebrtcStateChanged: Decodable {
        /** 変更があったユーザーのId */
        let userId: UUID
        /** ユーザーの変更後の接続チャンネルのId */
        let channelId: UUID
        /** ユーザーの変更後の状態 */
        let sessions: [Session]

        public struct Session: Decodable {
            /** 状態 */
            let state: String
            /** セッションID */
            let sessionId: UUID
        }
    }

    public struct UserViewstateChanged: Decodable {
        /** 変化したWSセッションを含めた、該当ユーザーの変更後の状態 */
        let viewStates: [ViewState]

        public struct ViewState: Decodable {
            /** WSセッションの識別子 */
            let key: String
            /** 閲覧しているチャンネルId */
            let channelId: UUID
            /** 閲覧状態 */
            let state: ChannelViewState
        }
    }

    public struct UserOnline: Decodable {
        /** オンラインになったユーザーのId */
        let id: UUID
    }

    public struct UserOffline: Decodable {
        /** オフラインになったユーザーのId */
        let id: UUID
    }

    public struct UserGroupCreated: Decodable {
        /** 作成されたユーザーグループのId */
        let id: UUID
    }

    public struct UserGroupUpdated: Decodable {
        /** 作成されたユーザーグループのId */
        let id: UUID
    }

    public struct UserGroupDeleted: Decodable {
        /** 削除されたユーザーグループのId */
        let id: UUID
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
        let id: UUID
        /** (DMの場合のみ */
        let dmUserId: UUID?
    }

    public struct ChannelUpdated: Decodable {
        /** 変更があったチャンネルのId */
        let id: UUID
        /** (DMの場合のみ */
        let dmUserId: UUID?
    }

    public struct ChannelDeleted: Decodable {
        /** 削除されたチャンネルのId */
        let id: UUID
        /** (DMの場合のみ */
        let dmUserId: UUID?
    }

    public struct ChannelStared: Decodable {
        /** スターしたチャンネルのId */
        let id: UUID
    }

    public struct ChannelUnstared: Decodable {
        /** スターしたチャンネルのId */
        let id: UUID
    }

    public struct ChannelViewersChanged: Decodable {
        /** 変化したチャンネルのId */
        let id: UUID
        /** 変化後の閲覧者 */
        let viewers: [Viewer]

        public struct Viewer: Decodable {
            /** ユーザーId */
            let userId: UUID
            /** 閲覧状態 */
            let state: ChannelViewState
            /** 閲覧状態の更新日時 */
            let updateAt: Date
        }
    }

    public struct ChannelSubscribersChanged: Decodable {
        /** 変化したチャンネルのId */
        let id: UUID
    }

    // message payloads

    public struct MessageCreated: Decodable {
        /** 投稿されたメッセージのId */
        let id: UUID
        /** 投稿されたメッセージがWebSocketを接続しているユーザーの投稿を引用しているかどうか */
        let isCiting: Bool
    }

    public struct MessageUpdated: Decodable {
        /** 更新されたメッセージのId */
        let id: UUID
    }

    public struct MessageDeleted: Decodable {
        /** 削除されたメッセージのId */
        let id: UUID
    }

    public struct MessageStamped: Decodable {
        /** メッセージId */
        let messageId: UUID
        /** スタンプを押したユーザーのId */
        let userId: UUID
        /** スタンプのId */
        let stampId: UUID
        /** そのユーザーが押した数 */
        let count: Int
        /** そのユーザーがそのスタンプをそのメッセージに最初に押した日時 */
        let createdAt: Date
    }

    public struct MessageUnstamped: Decodable {
        /** メッセージId */
        let messageId: UUID
        /** スタンプを押したユーザーのId */
        let userId: UUID
        /** スタンプのId */
        let stampId: UUID
    }

    public struct MessagePinned: Decodable {
        /** ピンされたメッセージのID */
        let messageId: UUID
        /** ピンされたメッセージのチャンネルID */
        let channelId: UUID
    }

    public struct MessageUnpinned: Decodable {
        /** ピンが外されたメッセージのID */
        let messageId: UUID
        /** ピンが外されたメッセージのチャンネルID */
        let channelId: UUID
    }

    public struct MessageRead: Decodable {
        /** 読んだチャンネルId */
        let id: UUID
    }

    // stamp payloads

    public struct StampCreated: Decodable {
        /** 作成されたスタンプのId */
        let id: UUID
    }

    public struct StampUpdated: Decodable {
        /** 修正されたスタンプのId */
        let id: UUID
    }

    public struct StampDeleted: Decodable {
        /** 削除されたスタンプのId */
        let id: UUID
    }

    public struct StampPaletteCreated: Decodable {
        /** 作成されたスタンプパレットのId */
        let id: UUID
    }

    public struct StampPaletteUpdated: Decodable {
        /** 修正されたスタンプパレットのId */
        let id: UUID
    }

    public struct StampPaletteDeleted: Decodable {
        /** 削除されたスタンプパレットのId */
        let id: UUID
    }

    // clip payloads

    public struct ClipFolderCreated: Decodable {
        /** 作成されたクリップフォルダーのId */
        let id: UUID
    }

    public struct ClipFolderUpdated: Decodable {
        /** 更新されたクリップフォルダーのId */
        let id: UUID
    }

    public struct ClipFolderDeleted: Decodable {
        /** 削除されたクリップフォルダーのId */
        let id: UUID
    }

    public struct ClipFolderMessageAdded: Decodable {
        /** メッセージが除外されたクリップフォルダーのId */
        let folderId: UUID
        /** クリップフォルダーから除外されたメッセージのId */
        let messageId: UUID
    }

    public struct ClipFolderMessageDeleted: Decodable {
        /** メッセージが追加されたクリップフォルダーのId */
        let folderId: UUID
        /** クリップフォルダーに追加されたメッセージのId */
        let messageId: UUID
    }
}
