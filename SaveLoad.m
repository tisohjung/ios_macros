    //
//  SaveLoad.m
//  PlusM
//
//  Created by macbook on 11. 2. 26..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaveLoad.h"

@implementation SaveLoad

+ (void)saveToUserDefaults:(NSString *)key value:(id)value
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults) {
		[standardUserDefaults setObject:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (id)retrieveFromUserDefaults:(NSString*)key {
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	id val = nil;
	if (standardUserDefaults) {
		val = [standardUserDefaults objectForKey:key];
	}
	return val;
}

- (void)dealloc {
    [super dealloc];
}

+ (NSString*)stringWithCommas:(NSString*)string
{
	if (string == nil) {
		return @"";
	}
	NSString *strRemoveComma = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
//	NSString *strRemoveWon = [strRemoveComma stringByReplacingOccurrencesOfString:@"원" withString:@""];
	
//	strRemoveComma = [NSString stringWithFormat:@"%@%@",strRemoveWon,string];
	
	//넘버포메터를 생성하고 셋팅해줍니다.
	NSNumberFormatter *frmtr = [[NSNumberFormatter alloc] init];
	// 3자리 숫자마자 그룹하고
	[frmtr setGroupingSize:3];
	// 그룹의 분할은 ','로
	[frmtr setGroupingSeparator:@","];
	// 그룹분할을 사용함으로.
	[frmtr setUsesGroupingSeparator:YES];
	
	//일단 텍스트 필드에서 받은 스트링을 NSNumber로 변환
	NSNumber *number = [frmtr numberFromString:strRemoveComma];
	
	//조합된 결과
	NSString *strResult = [NSString stringWithFormat:@"%@",[frmtr stringFromNumber:number]];
	
	// 넘버포메터 릴리즈
	[frmtr release];
	
	//NSNumber를 NSNumberFormatter에서 변환 후 스트링으로 출력
//	string = strResult;
	return strResult;
}
@end
