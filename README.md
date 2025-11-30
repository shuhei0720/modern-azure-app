# Sample Web Application

## 利用アーキテクチャ

* Node.js v22
* MySQL v8


## Docker を使った実行

### ビルド

```
docker build -t webapp:0.1 .
```

### 個別実行

1. MySQLの起動

    ```
    docker run \
      -d \
      -e MYSQL_ROOT_PASSWORD=YOUR_PASSWORD \
      -e MYSQL_DATABASE=notes \
      --mount type=bind,src=$(pwd)/db/initdb,dst=/docker-entrypoint-initdb.d \
      --name mysql \
      mysql:8.4 \
      --character-set-server=utf8mb4 \
      --collation-server=utf8mb4_unicode_ci
    ```

1. Webアプリの起動

    ```
    docker run \
      -d \
      -p 8080:3000 \
      -e MYSQL_HOST=172.17.0.2 \
      -e MYSQL_USER=root \
      -e MYSQL_PASSWORD=YOUR_PASSWORD \
      -e MYSQL_DATABASE=notes \
      --name webapp \
      webapp:0.1
    ```

うまく動作しない場合の確認に必要な参考コマンド

* ネットワーク調査
    ```
    docker network ls
    docker network inspect bridge
    ```
* 調査用コンテナ起動
    ```
    docker run -d --name mysqlclient mysql:8.4
    docker exec -it mysqlclient bash
    ```

### まとめて実行（docker-compsoe）

```
docker-compose up
```


## インフラ構築

1. インフラの展開

    ```
    terraform init
    ```

    ```
    az login --use-device-code
    terraform apply -auto-approve
    ```

1. 手動でデータベースの初期化

    以下のコマンドでMySQLへログインして、初期化SQLファイルの中身をコピー＆ペーストして実行

    ```
    az mysql flexible-server connect \
      --name {MYSQL_NAME} \
      --admin-user {ADMIN_USERNAME} \
      --database-name {MYSQL_DBNAME} \
      --interactive
    ```

    もしくは以下のコマンドで初期化SQLファイルを直接実行

    ```
    az mysql flexible-server execute \
      --name {MYSQL_NAME} \
      --admin-user {ADMIN_USERNAME} \
      --admin-password {ADMIN_PASSWORD} \
      --database-name {MYSQL_DBNAME} \
      --file-path {FILE_PATH}
    ```


1. 手動でのコンテナ登録

    ```
    az acr login \
      --name {ACR_NAME} \
      --username {USERNAME} \
      --password {PASSWORD}
    ```

    ```
    cd ./app
    az acr build \
      --registry {ACR_NAME} \
      --file Dockerfile \
      --image webapp:0.1 \
      .
    ```