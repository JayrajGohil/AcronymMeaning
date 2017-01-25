//
//	RootClass.m
//
//	Create by Software Merchant on 25/1/2017
//	Copyright © 2017 Software Merchant. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//



#import "AcronymResult.h"

NSString *const kRootClassLfs = @"lfs";
NSString *const kRootClassSf = @"sf";

@interface AcronymResult ()
@end
@implementation AcronymResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kRootClassLfs] != nil && [dictionary[kRootClassLfs] isKindOfClass:[NSArray class]]){
		NSArray * lfsDictionaries = dictionary[kRootClassLfs];
		NSMutableArray * lfsItems = [NSMutableArray array];
		for(NSDictionary * lfsDictionary in lfsDictionaries){
			Lf * lfsItem = [[Lf alloc] initWithDictionary:lfsDictionary];
			[lfsItems addObject:lfsItem];
		}
		self.lfs = lfsItems;
	}
	if(![dictionary[kRootClassSf] isKindOfClass:[NSNull class]]){
		self.sf = dictionary[kRootClassSf];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.lfs != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Lf * lfsElement in self.lfs){
			[dictionaryElements addObject:[lfsElement toDictionary]];
		}
		dictionary[kRootClassLfs] = dictionaryElements;
	}
	if(self.sf != nil){
		dictionary[kRootClassSf] = self.sf;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.lfs != nil){
		[aCoder encodeObject:self.lfs forKey:kRootClassLfs];
	}
	if(self.sf != nil){
		[aCoder encodeObject:self.sf forKey:kRootClassSf];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.lfs = [aDecoder decodeObjectForKey:kRootClassLfs];
	self.sf = [aDecoder decodeObjectForKey:kRootClassSf];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AcronymResult *copy = [AcronymResult new];

	copy.lfs = [self.lfs copyWithZone:zone];
	copy.sf = [self.sf copyWithZone:zone];

	return copy;
}
@end
