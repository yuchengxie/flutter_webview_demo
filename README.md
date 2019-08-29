# flutter_webview_demo

one flutter WebView demo

## Getting Started

## 1.flutter创建WebView
  可以使用官方的flutter_WebView,也可以使用插件WebView_flutter_plugin,我用的是官方的
  flutter_Webview
## 2.安装官方插件
  cd /项目根目录
  flutter pub get flutter_WebView
  或者在pubspec.yaml添加 flutter_WebView:^版本
## 3.ios需要修改info.plist
    cd 项目/ios/Runner/
    vim Info.plist 添加配置

    <key>io.flutter.embedded_views_preview</key>
    <string>YES</string>

    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>

  
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
