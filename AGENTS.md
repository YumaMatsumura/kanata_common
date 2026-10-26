# KANATA repository guidance

このファイルと`.github/kanata/review/`は、`kanata_workflow`から生成したレビュー用の入口と規約です。
原本の版は[SOURCE.json](.github/kanata/review/SOURCE.json)に記録しています。生成物を手作業で編集せず、配布ツールで更新します。

以下は差分・PRのレビューに適用します。通常の実装作業では、ユーザーの依頼と適用されるワークスペースの指示に従います。

## Code Review Rules

- レビューを始めるときは、[レビュー基準](.github/kanata/review/rules/review.md)と[説明方法](.github/kanata/review/rules/communication.md)を読みます。
- 変更範囲と既存動作は[共通方針](.github/kanata/review/rules/common.md)、ROS 2の前提は[KANATAの規約](.github/kanata/review/rules/kanata.md)で確認します。
- コード・launch・設定・テストの変更では、関係する[コーディング規約](.github/kanata/review/rules/coding.md)を確認します。
  検証内容とCI結果は[検証の規約](.github/kanata/review/rules/testing.md)に従って判断します。
- レビューの依頼だけでコード修正や実機操作まで許可されたとは扱いません。
  必要な資料・依存先・検証結果が確認できない場合は、推測で補わず未確認として伝えます。
