//
//  BusinessCardsDataModel.m
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardsDataModel.h"

@interface BusinessCardsDataModel ()

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;

- (NSString *)documentsDirectory;

@end

@implementation BusinessCardsDataModel
@synthesize mainObjectContext = _mainObjectContext, persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)sharedModel {
    static BusinessCardsDataModel *__instance = nil;
    if (!__instance) {
        __instance = [[BusinessCardsDataModel alloc] init];
    }
    return __instance;
}

- (NSString *)modelName {
    return @"BusinessCards";
}

- (NSString *)pathToModel {
    return [[NSBundle mainBundle] pathForResource:[self modelName] ofType:@"momd"];
}

- (NSString *)storeFilename {
    return [[self modelName] stringByAppendingPathExtension:@"sqlite"];
}

- (NSString *)pathToLocalStore {
    return [[self documentsDirectory] stringByAppendingPathComponent:[self storeFilename]];
}

- (NSString *)documentsDirectory {
    NSString *documentsDirectory;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSManagedObjectContext *)mainObjectContext {
    if (!_mainObjectContext) {
        _mainObjectContext = [[NSManagedObjectContext alloc] init];
        _mainObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _mainObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToLocalStore]];
        
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @(YES),
                                  NSInferMappingModelAutomaticallyOption: @(YES)};
        
        NSError *error;
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
            NSDictionary *userInfo = @{NSUnderlyingErrorKey: error};
            NSString *reason = @"Could not create persistent store.";
            
            NSException *exception = [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:userInfo];
            @throw exception;
        }
        _persistentStoreCoordinator = persistentStoreCoordinator;
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToModel]];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:storeURL];
    }
    return _managedObjectModel;
}

@end
