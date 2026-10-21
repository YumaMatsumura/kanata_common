# kanata_lint_common

## 概要

KANATAのROS 2パッケージで使用するlint（コードや設定ファイルの問題を調べる検査）をまとめたパッケージです。
利用側から`ament_lint_auto`を通して読み込むと、共通の検査をCMakeのテストとして登録できます。
現在は、次の3種類を対象としています。

| 検査用パッケージ | 検査内容 |
| --- | --- |
| `ament_cmake_cppcheck` | C・C++コードを実行せずに解析し、不具合の可能性を調べます。 |
| `ament_cmake_lint_cmake` | `CMakeLists.txt`や`.cmake`ファイルの書き方を検査します。 |
| `ament_cmake_xmllint` | `package.xml`やlaunchのXMLファイルを検査します。 |

各検査は、対応するファイルがある場合に登録されます。
リポジトリの`pre-commit`とは別の仕組みで、ビルド時に登録した検査を`colcon test`で実行します。

## 使い方

利用するパッケージの`package.xml`に、次のテスト依存関係を追加します。

```xml
<test_depend>ament_lint_auto</test_depend>
<test_depend>kanata_lint_common</test_depend>
```

[kanata_cmake](../kanata_cmake/README.md)を使う場合は、`kanata_package()`が検査の登録も行うため、追加のCMake処理は不要です。
`kanata_lint_common`を依存関係に書くだけでは検査は実行されず、ビルドとテストの実行が必要です。

`kanata_cmake`を使わない場合は、`ament_package()`より前に次の処理を追加します。

```cmake
if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()
```

ワークスペース直下で、検査したいパッケージを指定して実行します。
`my_package`は対象のパッケージ名に置き換えてください。

```bash
cd ~/kanata_ws
source /opt/ros/jazzy/setup.bash
colcon build --packages-up-to my_package --cmake-args -DBUILD_TESTING=ON
source install/setup.bash
colcon test --packages-select my_package --return-code-on-test-failure
colcon test-result --verbose
```

XML検査では、XMLファイルにスキーマの指定がある場合、その定義も参照します。
現在の`package.xml`は外部サイトのスキーマを指定しているため、検査時にネットワーク接続が必要です。

## 参考

- [ament_lint_autoの使い方](https://github.com/ament/ament_lint/blob/jazzy/ament_lint_auto/doc/index.rst)：テスト依存関係から複数のlintを登録する仕組みを説明しています。
- [ament_lint](https://github.com/ament/ament_lint)：各検査ツールの実装と説明があります。
- [Autowareの共通CMake・lintパッケージ](https://github.com/autowarefoundation/autoware_cmake)：検査用パッケージをまとめる構成の参考です。
