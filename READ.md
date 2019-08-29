1.flutter创建WebView
  可以使用官方的flutter_WebView,也可以使用插件WebView_flutter_plugin,我用的是官方的
  flutter_Webview
2.安装官方插件
  cd /项目根目录
  flutter pub get flutter_WebView
  或者在pubspec.yaml添加 flutter_WebView:^版本
3.ios需要修改info.plist
 cd 项目/ios/Runner/
 vim Info.plist 添加配置
    <key>io.flutter.embedded_views_preview</key>
    <string>YES</string>

    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>

  