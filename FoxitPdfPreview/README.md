<!--
# license: Licensed to the Apache Software Foundation (ASF) under one
#         or more contributor license agreements.  See the NOTICE file
#         distributed with this work for additional information
#         regarding copyright ownership.  The ASF licenses this file
#         to you under the Apache License, Version 2.0 (the
#         "License"); you may not use this file except in compliance
#         with the License.  You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#         Unless required by applicable law or agreed to in writing,
#         software distributed under the License is distributed on an
#         "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#         KIND, either express or implied.  See the License for the
#         specific language governing permissions and limitations
#         under the License.
-->

# cordova-plugin-foxitpdf
This plugin provides the ability to preview pdf files with Foxit Pdf Sdk on a device.

![](https://github.com/niuemperor/cordova-plugin-foxitpdf/blob/master/images/cordova-plugin-foxitpdf.gif)

__NOTE__:                 
使用插件的时候，必须提前将 Foxit Pdf Sdk 引入到 项目中。

如何引入请参考Blog:xxxxxxx

When using plug-ins, Foxit Pdf Sdk must be introduced to the project in advance.

## Installation
```bash
cordova plugin add cordova-plugin-foxitpdf
```


## How To Use

Use this ,in everywhere in your project

```js
var success = function(data){
    console.log(data);
}
var error = function(data){
    console.log(data);
}
var filePath = 'file://path/to/your/file';
window.FoxitPdf.preview(filePath,success,error);
```


## Supported Platforms

- iOS


### iOS Quirks
preiview方法的第一个参数，目前只支持传入文件的绝对路径。

可以使用 [cordova-plugin-file](https://github.com/apache/cordova-plugin-file) 插件提供的方法，获取到文件的绝对路径。

使用以下命令，添加 [cordova-plugin-file](https://github.com/apache/cordova-plugin-file) 插件到你的项目中


The first argument to the preiview method, currently only supports absolute paths to incoming files.

You can obtain the absolute path to the file using the method provided by the [cordova-plugin-file] (https://github.com/apache/cordova-plugin-file) plugin.

Use the following command to add the [cordova-plugin-file] (https://github.com/apache/cordova-plugin-file) plugin to your project

```bash
cordova plugin add cordova-plugin-file
```

### Quick Example

需要事先将pdf文件放入项目中。位置默认放在项目根目录

The pdf file needs to be placed in the project beforehand. The location is placed in the project root by default

```js
var success = function(data){
    console.log(data);
}
var error = function(data){
    console.log(data);
}
function preview(){
    var filePath = cordova.file.applicationDirectory + 'getting_started_ios.pdf';
    window.FoxitPdf.preview(filePath,success,error);
}
```
## Attention
----
产品目前还是处于刚开发阶段. 后期将会着重于功能的完善和细化.

The product is still in the early stage of development. Later will focus on the function of refinement and refinement.


## Feedback or contribution code
------------
您可以在[这里](https://github.com/niuemperor/cordova-plugin-foxitpdf/issues)给我们提出在使用中碰到的问题或Bug。

你也可以发送邮件**huang_niu@foxitsoftware.com**说明您的问题。

如果你有更好代码实现,请 fork 此项目并发起您的 Pull-Request，我们会及时处理。感谢!


You can ask us questions or bugs in the use of [https://github.com/niu- imperial/cordova-plugin-foxitpdf/issues].

You can also send email **huang_niu@foxitsoftware.com** to explain your problem.

If you have a better code implementation, please fork this project and launch your Pull-Request, we will promptly deal with. thank!