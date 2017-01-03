# Perfect 会话示例 - MySQL 驱动 [English](README.md)

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

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

## 问题报告

目前我们已经把所有错误报告合并转移到了JIRA上，因此github原有的错误汇报功能不能用于本项目。

您的任何宝贵建意见或建议，或者发现我们的程序有问题，欢迎您在这里告诉我们。[http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1)。

问题清单请参考以下链接：[http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)。

## 更多信息

更多信息请访问 [perfect.org](perfect.org)。
