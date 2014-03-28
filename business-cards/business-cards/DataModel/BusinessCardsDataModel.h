//
//  BusinessCardsDataModel.h
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

@interface BusinessCardsDataModel : NSObject

+ (instancetype)sharedModel;

@property (readonly, nonatomic) NSManagedObjectContext *mainObjectContext;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)modelName;
- (NSString *)pathToModel;
- (NSString *)storeFilename;
- (NSString *)pathToLocalStore;

@end
