# Perfect 会话示例 - MySQL 驱动 [English](README.md)

该示例展示了使用 MySQL 作为数据库时 Perfect 会话的用法。

## 兼容性

当前主分支可使用 Xcode 8.1 或 Ubuntu 上 3.0.1 版的 Swift 工具链进行编译。

## 编译 & 运行

该示例项目通过设置一个非常短的会话过期时间 (10秒) 来展示会话。

会话 ID 和会话数据被展示在示例页面中。刷新页面会看到会话数据中多了些随机数据。等待超过 10 秒再次刷新，这时新的会话开始并被展示。

### Xcode

我们建议您使用 [Perfect Assistant](http://perfect.org/en/assistant/) 来管理您的服务端 Swift 项目。

打开 Perfect Assistant，点击 "Create New Project"，选择 "Custom repository URL"。为要创建的项目选择一个存储路径，将下面的 repo 地址拷贝到 "Repository URL" 选项中：``` https://github.com/PerfectExamples/Perfect-Session-MySQL-Demo.git ```

项目创建好后，点击 "Build > Local" 按钮后会下载该项目的所有依赖库并创建 Xcode 项目文件。

打开该项目文件，选择 "Executable"（黑色按钮）。

现在可以运行该项目了。

### 终端

下面的命令会克隆该示例项目，创建一个空的启动项目并在 8181 端口启动服务器。

```
git clone https://github.com/PerfectExamples/Perfect-Session-MySQL-Demo.git
cd Perfect-Session-MySQL-Demo
swift build
.build/debug/Perfect-Session-MySQL-Demo
```

你会看到如下输出：

```
Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

现在服务器已经启动监听端口并等待连接。在浏览器中输入 [http://localhost:8181/](http://localhost:8181/) 可访问到示例页面。在终端按下 control-c 可终止服务器。

## 问题

GitHub 的 issues 提交已经失效，我们已经将 bugs 和 issues 的提交转移到了 JIRA 上。

如果你发现了错误，bug 或者有其他建议，请在 [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) 页面中提交。

更详细尚未解决的 issues 清单请访问 [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)。

## 更多信息

更多信息请访问 [perfect.org](perfect.org)。
