//
//	Var.m
//
//	Create by Software Merchant on 25/1/2017
//	Copyright © 2017 Software Merchant. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

#import <UIKit/UIKit.h>

@interface Var : NSObject

@property (nonatomic, assign) NSInteger freq;
@property (nonatomic, strong) NSString * lf;
@property (nonatomic, assign) NSInteger since;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end