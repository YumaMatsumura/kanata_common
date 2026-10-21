# kanata_cmake

## 概要

KANATAのROS 2 Jazzyパッケージで、ビルド設定とインストール処理を共通化するパッケージです。
各パッケージの`CMakeLists.txt`に同じ設定を書く手間を減らし、設定のばらつきを防ぎます。

| マクロ | 役割 | 呼び出す位置 |
| --- | --- | --- |
| `kanata_package()` | C++の設定、依存関係の読み込み、lintの登録を行います。 | ビルド対象を登録する前 |
| `kanata_auto_package()` | ビルドしたライブラリ・実行ファイルや指定したディレクトリをインストールし、パッケージ情報を公開します。 | 最後 |

`kanata_package()`はC++の規格が未指定の場合にC++17を設定し、GCC・Clangでは警告を既定でエラーとして扱います。
`kanata_auto_package()`は`ament_auto_package()`を呼び、`USE_SCOPED_HEADER_INSTALL_DIR`を自動で指定します。
これにより、ヘッダーのインストール先をパッケージ別の`include/<パッケージ名>`にまとめます。

## 使い方

利用するパッケージの`package.xml`に、次の依存関係を追加します。

```xml
<buildtool_depend>kanata_cmake</buildtool_depend>
<test_depend>ament_lint_auto</test_depend>
<test_depend>kanata_lint_common</test_depend>
```

`CMakeLists.txt`では、次の順序で呼び出します。

```cmake
cmake_minimum_required(VERSION 3.16)
project(my_package)

find_package(kanata_cmake REQUIRED)
kanata_package()

# 必要に応じてament_auto_add_library()などでビルド対象を登録します。

kanata_auto_package()
```

launchファイルや設定ファイルもインストールする場合は、最後の呼び出しを次のようにします。
実際に存在するディレクトリだけを指定してください。

```cmake
kanata_auto_package(
  INSTALL_TO_SHARE
  launch config
)
```

`USE_SCOPED_HEADER_INSTALL_DIR`を利用側で書く必要はありません。
その他の引数は`ament_auto_package()`にそのまま渡せます。
ヘッダーがないlaunch専用パッケージでも利用できます。

`BUILD_TESTING=ON`の場合は、`package.xml`のテスト依存関係に従ってlintを登録します。
検査内容と実行方法は[kanata_lint_common](../kanata_lint_common/README.md)を参照してください。

## 参考

- [ament_cmake_auto](https://github.com/ament/ament_cmake/tree/jazzy/ament_cmake_auto)：依存関係の読み込みやビルド・インストール処理の基盤です。
- [ament_auto_package()の実装](https://github.com/ament/ament_cmake/blob/jazzy/ament_cmake_auto/cmake/ament_auto_package.cmake)：インストール用の引数とヘッダー配置の説明があります。
- [Autowareの共通CMakeパッケージ](https://github.com/autowarefoundation/autoware_cmake)：プロジェクト全体の設定を共通化する構成の参考です。
