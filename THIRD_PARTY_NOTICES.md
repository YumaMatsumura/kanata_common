# 第三者由来の設定と出典

確認日：2026-10-16。対象は、このリポジトリに取り込まれている設定ファイルです。
第三者の権利・ライセンス表示は維持し、本プロジェクトの著作権表示で置き換えません。

## ament_lintから取り込んだ設定

上流プロジェクトは[ament/ament_lint](https://github.com/ament/ament_lint)です。
以下の確認には、固定コミット`ebd524bb9973d5ec1dc48a670ce54f958a5a0243`を使用しました。
上流の[LICENSE](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/LICENSE)はApache License 2.0であり、
その本文を本リポジトリの[LICENSE](LICENSE)に同梱しています。

### CPPLINT.cfg

- 参照元：[ament_cpplint/main.py](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_cpplint/ament_cpplint/main.py)。元のコメントで上記コミットが指定されています。
- 対象部分：`main()`内の標準フィルターと関連コメント、行長の既定値。
- 元ファイルの表示：`Copyright 2014-2015 Open Source Robotics Foundation, Inc.`、Apache License 2.0。
- 変更内容：Python内の設定を`CPPLINT.cfg`形式に抽出。`set noparent`、include順序設定、追加のフィルターとコメントを設定。
- 元ファイルの著作権・ライセンス表示を`CPPLINT.cfg`にも保持しています。

`ament_cpplint`の[package.xml](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_cpplint/package.xml)にはApacheとBSDの両方が記載されています。
同パッケージ内の[cpplint.py](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_cpplint/ament_cpplint/cpplint.py)はGoogleの著作権表示とBSD条件を持ちますが、
この実装ファイルは本リポジトリには取り込んでいません。今回の設定の参照元は、Apache-2.0の`main.py`です。

### setup.cfg

- 参照元：[ament_flake8.ini](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_flake8/ament_flake8/configuration/ament_flake8.ini)。元のコメントで上記コミットが指定されています。
- ライセンス：上流LICENSEおよび[package.xml](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_flake8/package.xml)はApache License 2.0。設定ファイル内に個別の著作権表示はありません。
- 変更内容：flake8の抑制項目を追加、import順序を`google`から`pep8`へ変更、行長を99から100へ変更、isort設定を追加。

### .clang-format

- 元の参照先：[ament_clang_formatのmaster上の設定](https://github.com/ament/ament_lint/blob/master/ament_clang_format/ament_clang_format/configuration/.clang-format)。取り込み時のコミットは記録されていません。
- 確認・比較用：[上記固定コミットの設定](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_clang_format/ament_clang_format/configuration/.clang-format)。これを実際の取り込みコミットと断定するものではありません。
- ライセンス：比較用コミットのLICENSEおよび[package.xml](https://github.com/ament/ament_lint/blob/ebd524bb9973d5ec1dc48a670ce54f958a5a0243/ament_clang_format/package.xml)はApache License 2.0。設定ファイル内に個別の著作権表示はありません。
- 比較用コミットとの差分：YAMLの文書マーカーを省略、短い関数の扱いとinclude分類を追加、コメントの折り返しを有効化。

比較用コミットとの差分は、取り込み後に本プロジェクトだけが行った変更を証明する履歴ではありません。
取り込み当時の記録が見つかった場合は、この節を更新してください。

## NOTICEと外部ツールの扱い

確認した固定コミットの上流ツリーには`NOTICE`／`NOTICE.txt`はありませんでした。
今回は空の`NOTICE`を追加せず、本ファイルに出典・表示・変更内容をまとめています。
Apache-2.0の再配布条件は、同梱のLICENSEの第4項を参照してください。

`.pre-commit-config.yaml`やGitHub Actionsで参照するツールは、それぞれの配布元から取得して実行します。
現在、その実装コードを本リポジトリへ同梱していません。各ツールへの参照は、設定自体のコピー元を証明するものではありません。
将来ツール本体・ライブラリ・素材を取り込んだり配布物へ同梱したりする場合は、対象ファイルと取得版に応じて表示・ライセンス本文を追加してください。

## 今後、設定やコードを取り込むとき

1. 取得元のURL、タグまたはコミット、取り込むファイル・範囲を記録します。
2. その範囲に適用されるライセンス、著作権・帰属表示、NOTICEを確認して保持します。
3. 元のファイルを変更した場合は、変更したことが分かる表示を残します。
4. 必要なライセンス本文を同梱し、本ファイルを更新します。

この一覧は、記録された参照元を確認した範囲のものです。出典の記録がない部分について、第三者由来でないことを証明する一覧ではありません。
