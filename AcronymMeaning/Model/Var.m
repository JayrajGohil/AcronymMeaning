//
//	Var.m
//
//	Create by Software Merchant on 25/1/2017
//	Copyright © 2017 Software Merchant. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//



#import "Var.h"

NSString *const kVarFreq = @"freq";
NSString *const kVarLf = @"lf";
NSString *const kVarSince = @"since";

@interface Var ()
@end
@implementation Var




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kVarFreq] isKindOfClass:[NSNull class]]){
		self.freq = [dictionary[kVarFreq] integerValue];
	}

	if(![dictionary[kVarLf] isKindOfClass:[NSNull class]]){
		self.lf = dictionary[kVarLf];
	}	
	if(![dictionary[kVarSince] isKindOfClass:[NSNull class]]){
		self.since = [dictionary[kVarSince] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kVarFreq] = @(self.freq);
	if(self.lf != nil){
		dictionary[kVarLf] = self.lf;
	}
	dictionary[kVarSince] = @(self.since);
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
	[aCoder encodeObject:@(self.freq) forKey:kVarFreq];	if(self.lf != nil){
		[aCoder encodeObject:self.lf forKey:kVarLf];
	}
	[aCoder encodeObject:@(self.since) forKey:kVarSince];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.freq = [[aDecoder decodeObjectForKey:kVarFreq] integerValue];
	self.lf = [aDecoder decodeObjectForKey:kVarLf];
	self.since = [[aDecoder decodeObjectForKey:kVarSince] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Var *copy = [Var new];

	copy.freq = self.freq;
	copy.lf = [self.lf copyWithZone:zone];
	copy.since = self.since;

	return copy;
}
@end