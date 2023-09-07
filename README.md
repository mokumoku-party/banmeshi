# Banmeshi

晩飯の在庫と料理を管理するアプリ

## protoからコード生成

### Go

プロジェクト直下で以下のコマンドを実行
```
buf generate
```

### Dart

プロジェクト直下でコマンドを実行

```
protoc \
  --dart_out=grpc:./client/banmeshi_flutter/lib/gen/proto \
  -I ./proto/ ./proto/*.proto
```

## 資料

- <https://www.figma.com/file/br5qm35aLvveck3oCmOK5E/%E6%99%A9%E9%A3%AF%E4%BD%9C%E3%82%8BApp?type=whiteboard&node-id=0-1&t=DmfGUf75MOpS4q4m-0>
