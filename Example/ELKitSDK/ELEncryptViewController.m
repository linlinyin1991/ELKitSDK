//
//  ELEncryptViewController.m
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/29.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import "ELEncryptViewController.h"
#import "ELEncryptAES.h"
#import "NSString+ELEncode.h"
#import "NSData+ELEncode.h"

@interface ELEncryptViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *encryptResult;
@property (weak, nonatomic) IBOutlet UITextView *decryptResult;

/// 加密key
@property (nonatomic, copy) NSString *key;

// 偏移iv CBC加密需要用
@property (nonatomic, copy) NSString *iv;
/// 记录加密类型，解密的时候使用
@property (nonatomic, assign) NSInteger encryptType;

@end

@implementation ELEncryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.encryptResult.userInteractionEnabled = NO;
    self.decryptResult.userInteractionEnabled = NO;
    self.title = @"EncryptDemo";
    self.key = @"1234567890";
    self.iv = @"0987654321";
    self.textField.text = @"十年生死两茫茫";
}


// AES128 ECB 加密
- (IBAction)aes128BtnPressed:(id)sender {
    self.encryptType = 0;
    NSData *result = [ELEncryptAES el_dataByEncrypt:self.textField.text.el_utf8Data key:self.key mode:ELEncryptAES128 options:kCCOptionPKCS7Padding | kCCOptionECBMode iv:nil];
    NSString *resultStr = result.el_base64Encode.el_utf8String;
    self.encryptResult.text = resultStr;
}

// AES192 CBC 加密 需要偏移量iv
- (IBAction)aes192BtnPressed:(id)sender {
    self.encryptType = 1;
    NSData *result = [ELEncryptAES el_dataByEncrypt:self.textField.text.el_utf8Data key:self.key mode:ELEncryptAES192 options:kCCOptionPKCS7Padding iv:self.iv];
    NSString *resultStr = result.el_base64Encode.el_utf8String;
    self.encryptResult.text = resultStr;
}

// AES256 ECB 加密
- (IBAction)aes256BtnPressed:(id)sender {
    self.encryptType = 2;
    if (self.textField.text) {
        self.encryptResult.text = [ELEncryptAES stringByAes256Encrypt:self.textField.text key:self.key];
    }
    
}

- (IBAction)decryptBtnPressed:(id)sender {
    if (self.encryptType == 0) {
        NSData *result = [ELEncryptAES el_dataByDecrypt:self.encryptResult.text.el_base64DecodeData key:self.key mode:ELEncryptAES128 options:kCCOptionPKCS7Padding | kCCOptionECBMode iv:nil];
        self.decryptResult.text = result.el_utf8String;
    } else if (self.encryptType == 1) {
        NSData *result = [ELEncryptAES el_dataByDecrypt:self.encryptResult.text.el_base64DecodeData key:self.key mode:ELEncryptAES192 options:kCCOptionPKCS7Padding iv:self.iv];
        self.decryptResult.text = result.el_utf8String;
    } else if (self.encryptType == 2) {
        self.decryptResult.text = [ELEncryptAES stringByAes256Decrypt:self.encryptResult.text key:self.key];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
