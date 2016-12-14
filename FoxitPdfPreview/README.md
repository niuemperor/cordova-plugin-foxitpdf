# FoxitPdfPreiview-Cordova-iOS

# Install
```bash
cordova plugin add cordova-plugin-foxitpdf
```


# How to use
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