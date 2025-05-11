# 機能要件

- ユーザーを一意に識別できるようにする
- ユーザーは username, password によってログインができる
- 必要な画面
  - ログイン画面
    - ユーザー名とパスワードを入力するフォーム
    - ログインボタン
    - 新規登録画面へのリンク
  - 新規登録画面
    - ユーザー名、パスワードを入力するフォーム
    - 登録ボタン
    - ログイン画面へのリンク

# 非機能要件

- 画面のエンドポイント

  - ログイン画面: /login
  - 新規登録画面: /register

- データベース

  - sqlite を用いる
  - モデリング
    | テーブル名 | カラム名 | 型 | 制約 |
    |-----------|------------|----------|----------|
    | Note | id | integer | PK |
    | | title | string | |
    | | body | text | |
    | | user_id | string FK(User の id)
    | | create_at | datetime | |
    | | update_at | datetime | |
    | User | id | integer | PK |
    | | name | string | |
    | | password | string | |
    | | create_at | datetime | |

- 認証
  - Basic 認証プロトコルを使用
  - 認証フロー
    1. クライアントはユーザー名とパスワードを Base64 エンコードし、Authorization ヘッダーに付与して送信
    2. サーバーは Authorization ヘッダーをデコードしてユーザー名とパスワードを取得
    3. 取得したユーザー名とパスワードを User テーブルと照合
    4. 認証成功時: 200 OK レスポンス
    5. 認証失敗時: 401 Unauthorized レスポンス
  - セキュリティ要件
    - パスワードはハッシュ化して保存
    - 通信は HTTPS で暗号化
