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

可以使用 [cordova-plugin-file](https://github.com/apache/cordova-plugin-file) 插件提供的参数，获取到文件的绝对路径。

使用 一下命令，添加 [cordova-plugin-file](https://github.com/apache/cordova-plugin-file) 插件
```bash
cordova plugin add cordova-plugin-file
```

### Quick Example

需要事先将pdf文件放入项目中。位置默认放在项目根目录

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