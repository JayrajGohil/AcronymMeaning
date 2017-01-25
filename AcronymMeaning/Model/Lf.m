//
//	Lf.m
//
//	Create by Software Merchant on 25/1/2017
//	Copyright © 2017 Software Merchant. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//



#import "Lf.h"

NSString *const kLfFreq = @"freq";
NSString *const kLfLf = @"lf";
NSString *const kLfSince = @"since";
NSString *const kLfVars = @"vars";

@interface Lf ()
@end
@implementation Lf




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLfFreq] isKindOfClass:[NSNull class]]){
		self.freq = [dictionary[kLfFreq] integerValue];
	}

	if(![dictionary[kLfLf] isKindOfClass:[NSNull class]]){
		self.lf = dictionary[kLfLf];
	}	
	if(![dictionary[kLfSince] isKindOfClass:[NSNull class]]){
		self.since = [dictionary[kLfSince] integerValue];
	}

	if(dictionary[kLfVars] != nil && [dictionary[kLfVars] isKindOfClass:[NSArray class]]){
		NSArray * varsDictionaries = dictionary[kLfVars];
		NSMutableArray * varsItems = [NSMutableArray array];
		for(NSDictionary * varsDictionary in varsDictionaries){
			Var * varsItem = [[Var alloc] initWithDictionary:varsDictionary];
			[varsItems addObject:varsItem];
		}
		self.vars = varsItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kLfFreq] = @(self.freq);
	if(self.lf != nil){
		dictionary[kLfLf] = self.lf;
	}
	dictionary[kLfSince] = @(self.since);
	if(self.vars != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Var * varsElement in self.vars){
			[dictionaryElements addObject:[varsElement toDictionary]];
		}
		dictionary[kLfVars] = dictionaryElements;
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
	[aCoder encodeObject:@(self.freq) forKey:kLfFreq];	if(self.lf != nil){
		[aCoder encodeObject:self.lf forKey:kLfLf];
	}
	[aCoder encodeObject:@(self.since) forKey:kLfSince];	if(self.vars != nil){
		[aCoder encodeObject:self.vars forKey:kLfVars];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.freq = [[aDecoder decodeObjectForKey:kLfFreq] integerValue];
	self.lf = [aDecoder decodeObjectForKey:kLfLf];
	self.since = [[aDecoder decodeObjectForKey:kLfSince] integerValue];
	self.vars = [aDecoder decodeObjectForKey:kLfVars];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Lf *copy = [Lf new];

	copy.freq = self.freq;
	copy.lf = [self.lf copyWithZone:zone];
	copy.since = self.since;
	copy.vars = [self.vars copyWithZone:zone];

	return copy;
}
@end