# FHIR JPCore ver1.1用テストサイト
FHIRのJpCore環境作成のためのサンプルサイトです。

# 注意事項
このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。
このページの実装ガイドは常に修正、追加がある改訂版開発用ページです。

## クライアント環境
* [FHIR Shorthand & IG Publiser環境作成方法 **(作成中)** ](docs/enviroment.md)

## クライアントコンパイル手順
### Windowsの場合
``` ruby
#実行ディレクトリに移動
> cd (プロジェクトディレクトリ移動)

# (初回のみ実行)gitクローン
> git clone http://github.com/findex-miyakawa/fhir-jpcore-ig-test.git

# git 最新化
> cd fhir-jpcore-ig-test
> git fetch
> git pull

# (初回のみ実行)IgPublisher.jarのダウンロード
> _updatePublisher.bat

# igpublisherの実行
> _genonce.bat
```

### Ubuntuの場合
``` ruby
#実行ディレクトリに移動
> cd (プロジェクトディレクトリ移動)

# (初回のみ実行)gitクローン
> git clone http://github.com/findex-miyakawa/fhir-jpcore-ig-test.git

# git 最新化
> cd fhir-jpcore-ig-test
> git fetch
> git pull

# (初回のみ実行)IgPublisher.jarのダウンロード
> bash _updatePublisher.sh

# igpublisherの実行
> bash _genonce.sh
```

## GitHubAction 自動ビルド＆デプロイ
* [ビルド状況](https://github.com/findex-miyakawa/fhir-jpcore-ig-test/actions)
* [ビルド警告情報](https://findex-miyakawa.github.io/fhir-jpcore-ig-test/qa.html)
* [最新ビルド結果](https://findex-miyakawa.github.io/fhir-jpcore-ig-test/)

## FSH & Markdown記載ルール
* [FHIR Shorthand記載ルール **(作成中)** ](docs/fishingrule.md)
* [プロファイル説明用Markdown記載ルール **(作成中)** ](docs/template_intronotes.md)
* [JP Core IG記載ルール **(作成中)** ](docs/ig_rules.md)
* [github 利用ルール **(作成中)** ](docs/githubflow.md)

## 資料・学習用サイト等
* [FHIR Shorthand FSH School(外部リンク)](https://fshschool.org/)
* [FHIR Shorthand Overview(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/overview.html)
* [FHIR Shorthand Language Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/reference.html)
* [FHIR Shorthand Quick Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/FSHQuickReference.pdf)
* [Markdown記法 Basic(外部リンク)](https://www.markdownguide.org/basic-syntax/)
* [Markdown記法 Extended(外部リンク)](https://www.markdownguide.org/extended-syntax/)
