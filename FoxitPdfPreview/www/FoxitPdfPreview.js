var exec = require('cordova/exec');

var pdf = function(){};

pdf.prototype.preview =  function(arg0, success, error) {
    exec(success, error, "FoxitPdfPreview", "Preview", [arg0]);
};

var pdf = new pdf();
module.exports = pdf;