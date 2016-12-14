/********* FoxitPdf.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

#import <FoxitRDK/FSPDFObjC.h>
#import <FoxitRDK/FSPDFViewControl.h>

NSString *SN = @"ktoB0rBpK74y1CxIIa27WoLSBJEaSeR85eNAmzAk3UO+tLcp30i2Rw==";
NSString *UNLOCK = @"ezKXjt3HtGhz9LvoL0WQjY537790VFfbykNCI0MicbT/nvzzLizkxROx+Qmgegu7fShWS6YDidw1+E87HZS9r6q4CfW0c5gwfCSQnzSBxfmvppgJ0zikaOXIOadxmE4JNny4oSkFRJ7zBxpXmOx1jL4zlaU/DIcJtrc0HspXwmrCsIFMhfTg5ZHdYHitxrhRdRsiHoVY8TYDE5hFpgO7GvHHEpGGCELwwM4x50Q/3416zJZOp8QMsriH+61WGuvthdHTk6B3YKB6djPM8USsoQR4RHmUC7bUCtOSB+zNyEhDq/kQurqLaQTjfjtW/5iBeQ2EdqUFokN8LGd805B/tgT9yABMK7U6z3HMfd3ytXVqddJLZEmaMNcDu3Z3bqK/T856kSwXcCLJqn10u9lfdmzR78OUSdfz4l2gyiSSJLcySxth/E0UZExXO3TmaTAnl0nxTp3dVwlBCI0CcEWs5q7RLOL75AEFnpJXBHFtEPHRL8rAF1weErmF8d4TCgbncfCO5bj2E3R6IsBzd3JvdrXGGkDvuZ3E3EdVdFeer1iv147XCx/x8PNcgctXwnQji88lFUypkP+YWtGQ1lBwLX2DrzsDe91L8Lp+4NIoc6nGoDuWasAGa6VbYpmxrYtvM+5b0eHotgnqrA7DcgCRI72lUHEzZCM/W0tKtQkspvGsu4XSgzHmbt0RqhKyGpBGS2poxR8Q0Kyj1C/ITz8Xswp2bxwf8HPL++skvZ3uxFyUevOLuTD+t5Jah81Nylefa/2vAA9zTn+FYNuJpv0W4uu4TPGg3qvEKWNR5fJpD2LhLsliaxg3S4HwX1NzmGeta91CgZdhKwO99HyZR/MzdJ2DbHXTeWr50jHWr5xSvcR30Uqg396JLbepvtXsEYtsJFymBJnmBwalykfmBWPAIAnWS95AUhOeu9OdoqllO84NLrlATHnhxf9mBP3eLsbKuQEPsQImHwCgOjkiR96Q3gmPqmupWo+O9XoFw7+aqprXNdjopR0j6kF43u839xWUKdb0Svz7/Hl/t2+bINuWu+vuseV7xvRKpe6oKFl/KS6WWapqU5s6WvIi6/3x2ZXFNW6PBn5jNn3reHFn4zqWu5k6MGTul8iMZII0QWRIzQb0sbkSnwncf6siZV45UUbiIpL3NMgMkjoNtWVhlO0Cu/UYTbbmpMjzIacfwcI+yuC/xUJwGq+jKh3ri0oV7q9Wz91P6Q==";

@interface FoxitPdf : CDVPlugin {
  // Member variables go here.
}

- (void)Preview:(CDVInvokedUrlCommand*)command;
@end

@implementation FoxitPdf
{
    NSString *tmpCommandCallbackID;
}

- (void)Preview:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult *pluginResult = nil;
    
    // URL
    NSString *filePath = [command.arguments objectAtIndex:0];

    // check file exist
    NSURL *fileURL = [[NSURL alloc] initWithString:filePath];
    BOOL isFileExist = [self isExistAtPath:fileURL.path];
    
    if (filePath != nil && filePath.length > 0  && isFileExist) {
        // preview
        [self FoxitPdfPreview:fileURL.path];
        
        // result object
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"preview success"];
        tmpCommandCallbackID = command.callbackId;
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageToErrorObject:1];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

# pragma mark -- Foxit preview
-(void)FoxitPdfPreview:(NSString *)filePath {
    // init foxit sdk
    enum FS_ERRORCODE eRet = [FSLibrary init:SN key:UNLOCK];
    if (e_errSuccess != eRet) {
        return;
    }
    
    //load doc
    if (filePath == nil) {
        filePath = [[NSBundle mainBundle] pathForResource:@"getting_started_ios" ofType:@"pdf"];
    }
    
    FSPDFDoc* doc = [FSPDFDoc createFromFilePath:filePath];
    
    if (e_errSuccess!=[doc load:nil]) {
        return;
    }
    
    //init PDFViewerCtrl
    FSPDFViewCtrl* myTestViewCtrl;
    myTestViewCtrl = [[FSPDFViewCtrl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [myTestViewCtrl setDoc:doc];
    
    UIViewController *testctrl = [[UIViewController alloc] init];
    [testctrl.view addSubview:myTestViewCtrl];
    testctrl.view.backgroundColor = [UIColor whiteColor];
    
    //创建一个navigationbar
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.viewController.view.frame.size.width, 64)];
    [testctrl.view addSubview:navBar];
    //创建一个item
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"PDF Preview"];
    navBar.items = @[item];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(close)];
    item.rightBarButtonItem = button;
    
    [self.viewController presentViewController:testctrl animated:YES completion:nil];
}

# pragma mark -- close preview
-(void)close{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"close success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:tmpCommandCallbackID];
}

# pragma mark -- isExistAtPath
- (BOOL)isExistAtPath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    return isExist;
}

@end
