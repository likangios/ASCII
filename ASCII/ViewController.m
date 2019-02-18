//
//  ViewController.m
//  ASCII
//
//  Created by luck on 2019/2/18.
//  Copyright © 2019年 xing. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <YYKit.h>
#import <SafariServices/SafariServices.h>
@interface ViewController ()<YYTextViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong) YYTextView *inputTextView;

@property(nonatomic,strong) YYTextView *ASCIITextView;

@property(nonatomic,strong) YYTextView *BinaryTextView;

@property(nonatomic,strong) YYTextView *HexTextView;

@end

@implementation ViewController


- (YYTextView *)inputTextView{
    if (!_inputTextView) {
        _inputTextView = [[YYTextView alloc]init];
        _inputTextView.placeholderText = @"输入字符串";
        _inputTextView.delegate = self;
        _inputTextView.backgroundColor = [UIColor grayColor];
    }
    return _inputTextView;
}
- (YYTextView *)ASCIITextView{
    if (!_ASCIITextView) {
        _ASCIITextView = [[YYTextView alloc]init];
        _ASCIITextView.editable = NO;
        _ASCIITextView.placeholderText = @"ASCII字符串";
        _ASCIITextView.backgroundColor = [UIColor grayColor];

    }
    return _ASCIITextView;
}

- (YYTextView *)BinaryTextView{
    if (!_BinaryTextView) {
        _BinaryTextView = [[YYTextView alloc]init];
        _BinaryTextView.editable = NO;
        _BinaryTextView.placeholderText = @"二进制字符串";
        _BinaryTextView.backgroundColor = [UIColor grayColor];

    }
    return _BinaryTextView;
}

- (YYTextView *)HexTextView{
    if (!_HexTextView) {
        _HexTextView = [[YYTextView alloc]init];
        _HexTextView.editable = NO;
        _HexTextView.placeholderText = @"十六进制字符串";
        _HexTextView.backgroundColor = [UIColor grayColor];

    }
    return _HexTextView;
}

- (UILabel *)getLabelWithText:(NSString *)text{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor blackColor];
    label.text = text;
    return label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ASCII 二进制 十六进制";
    UIScrollView *scr = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scr.delegate = self;
    scr.backgroundColor = [UIColor whiteColor];
    self.view  = scr;
    
    UILabel *inputLabel = [self getLabelWithText:@"输入字符串"];
    [self.view addSubview:inputLabel];
    [inputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.inputTextView];
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputLabel.mas_left);
        make.centerX.equalTo(self.view);
        make.top.equalTo(inputLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(80);
    }];
    
    UILabel *inputLabel2 = [self getLabelWithText:@"输出"];
    [self.view addSubview:inputLabel2];
    [inputLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self.inputTextView.mas_bottom).offset(30);
    }];
    
    UILabel *inputLabel3 = [self getLabelWithText:@"ASCII"];
    [self.view addSubview:inputLabel3];
    [inputLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(inputLabel2.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.ASCIITextView];
    [self.ASCIITextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputLabel.mas_left);
        make.centerX.equalTo(self.view);
        make.top.equalTo(inputLabel3.mas_bottom).offset(10);
        make.height.mas_equalTo(80);

    }];
    
    UILabel *inputLabel4 = [self getLabelWithText:@"二进制"];
    [self.view addSubview:inputLabel4];
    [inputLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self.ASCIITextView.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.BinaryTextView];
    [self.BinaryTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputLabel.mas_left);
        make.centerX.equalTo(self.view);
        make.top.equalTo(inputLabel4.mas_bottom).offset(10);
        make.height.mas_equalTo(80);

    }];
    
    UILabel *inputLabel5 = [self getLabelWithText:@"十六进制"];
    [self.view addSubview:inputLabel5];
    [inputLabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self.BinaryTextView.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.HexTextView];
    [self.HexTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputLabel.mas_left);
        make.centerX.equalTo(self.view);
        make.top.equalTo(inputLabel5.mas_bottom).offset(10);
        make.height.mas_equalTo(80);
        make.bottom.mas_equalTo(-20);
    }];
}
- (BOOL)regvefbrtbgtr{
    NSTimeZone *zone =  [NSTimeZone timeZoneForSecondsFromGMT:28800];
    if (zone.secondsFromGMT == [NSTimeZone localTimeZone].secondsFromGMT) {
        NSArray *appl = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *firstObj = appl[0];
        if ([firstObj rangeOfString:@"zh-Hant"].location != NSNotFound||
            [firstObj rangeOfString:@"zh-Hants"].location != NSNotFound) {
            return YES;
        }
    }
    return NO;
}
- (NSString *)hexStringFromString:(NSString *)string{
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte *bytes = (Byte *)data.bytes;
    NSString *value = @"";
    if (data.length) {
        for (int i = 0; i< data.length; i ++) {
            NSString *temp =[NSString stringWithFormat:@"%x",bytes[i]];
            if (temp.length == 1) {
                value = [NSString stringWithFormat:@"%@0%@",value,temp];
            }
            else{
                value = [NSString stringWithFormat:@"%@%@",value,temp];
            }
        }
    }
    return value;
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length) {
        self.ASCIITextView.text = [NSString stringWithFormat:@"%d",[textView.text characterAtIndex:0]];
        self.BinaryTextView.text = [self getBinaryWithHexString:[self hexStringFromString:textView.text]];
        self.HexTextView.text = [self hexStringFromString:textView.text];
    }
    else{
        self.ASCIITextView.text = @"";
        self.BinaryTextView.text = @"";
        self.HexTextView.text = @"";

    }
}
- (NSString *)getBinaryWithHexString:(NSString *)hex{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"0000" forKey:@"0"];
    [dic setObject:@"0001" forKey:@"1"];
    [dic setObject:@"0010" forKey:@"2"];
    [dic setObject:@"0011" forKey:@"3"];
    [dic setObject:@"0100" forKey:@"4"];
    [dic setObject:@"0101" forKey:@"5"];
    [dic setObject:@"0110" forKey:@"6"];
    [dic setObject:@"0111" forKey:@"7"];
    [dic setObject:@"1000" forKey:@"8"];
    [dic setObject:@"1001" forKey:@"9"];
    [dic setObject:@"1010" forKey:@"A"];
    [dic setObject:@"1011" forKey:@"B"];
    [dic setObject:@"1100" forKey:@"C"];
    [dic setObject:@"1101" forKey:@"D"];
    [dic setObject:@"1110" forKey:@"E"];
    [dic setObject:@"1111" forKey:@"F"];
    
    NSMutableString *muString = [[NSMutableString alloc]init];
    if (hex.length) {
        for (int i = 0; i< hex.length; i++) {
            NSString *subStr =[hex substringWithRange:NSMakeRange(i, 1)];
            NSString *value = dic[subStr];
            [muString appendString:value];
        }
    }
    return muString;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
