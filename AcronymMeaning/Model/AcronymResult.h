//
//	RootClass.m
//
//	Create by Software Merchant on 25/1/2017
//	Copyright © 2017 Software Merchant. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

#import <UIKit/UIKit.h>
#import "Lf.h"

@interface AcronymResult : NSObject

@property (nonatomic, strong) NSArray * lfs;
@property (nonatomic, strong) NSString * sf;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
