iOS 日志(CocoaLumberjack)及日志在控制台显示颜色(XcodeColor) ：
1 配置好Xcode的显示颜色插件XCodeColor。
2  如果要修改Log输出的颜色可以使用如下代码：

[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor]
backgroundColor:nil forFlag:LOG_FLAG_INFO];
3 由于安装插件会影响原来的Xcode打包上传，我们在应用程序里复制一个Xcode，并重命名为XcodeSigner；
4 打开钥匙串，创建新证书，名称填CHLMA123，证书类型选择代码签名（Code Signing）；
5 在终端命令中输入：sudo codesign -f -s CHLMA123 /Applications/XcodeSigner.app
6 获得XcodeSigner的UUID，在终端命令行输入：defaults read
/Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
7 在github上下载好想安装的插件
8
检查info.plist中是否已经添加了第5步获得的UUID，未添加可能会造成XcodeSigner闪退。若文件中已经存在，直接运行项目即可；
9 运行成功后，关闭XcodeSigner，重新启动，这时会弹出如下两类提示框，分别选择“Load Bundle”和“允许”
10 Done.
