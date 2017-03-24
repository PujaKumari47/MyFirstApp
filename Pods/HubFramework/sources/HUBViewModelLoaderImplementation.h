/*
 *  Copyright (c) 2016 Spotify AB.
 *
 *  Licensed to the Apache Software Foundation (ASF) under one
 *  or more contributor license agreements.  See the NOTICE file
 *  distributed with this work for additional information
 *  regarding copyright ownership.  The ASF licenses this file
 *  to you under the Apache License, Version 2.0 (the
 *  "License"); you may not use this file except in compliance
 *  with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

#import "HUBViewModelLoader.h"
#import "HUBHeaderMacros.h"

@protocol HUBFeatureInfo;
@protocol HUBJSONSchema;
@protocol HUBContentOperation;
@protocol HUBContentReloadPolicy;
@protocol HUBConnectivityStateResolver;
@protocol HUBIconImageResolver;
@protocol HUBActionContext;
@protocol HUBActionPerformer;
@class HUBComponentDefaults;

NS_ASSUME_NONNULL_BEGIN

/// Concrete implementation of the `HUBViewModelLoader` API
@interface HUBViewModelLoaderImplementation : NSObject <HUBViewModelLoader>

/// Any object that performs actions on behalf of this view model loader
@property (nonatomic, weak, nullable) id<HUBActionPerformer> actionPerformer;

/**
 *  Initialize an instance of this class with its required dependencies & values
 *
 *  @param viewURI The URI of the view that this loader will load view models for
 *  @param featureInfo An object containing information about the feature that the loader will be used for
 *  @param contentOperations The content operations that will create content for loaded view models
 *  @param contentReloadPolicy Any policy that gonverns whether content should be reloaded at a given time
 *  @param JSONSchema The JSON schema that the loader should use for parsing
 *  @param componentDefaults The default values to use for component model builders created when loading view models
 *  @param connectivityStateResolver The connectivity state resolver used by the current `HUBManager`
 *  @param iconImageResolver The resolver to use to convert icons into renderable images
 *  @param initialViewModel Any pre-registered view model that the loader should include
 */
- (instancetype)initWithViewURI:(NSURL *)viewURI
                    featureInfo:(id<HUBFeatureInfo>)featureInfo
              contentOperations:(NSArray<id<HUBContentOperation>> *)contentOperations
            contentReloadPolicy:(nullable id<HUBContentReloadPolicy>)contentReloadPolicy
                     JSONSchema:(id<HUBJSONSchema>)JSONSchema
              componentDefaults:(HUBComponentDefaults *)componentDefaults
      connectivityStateResolver:(id<HUBConnectivityStateResolver>)connectivityStateResolver
              iconImageResolver:(nullable id<HUBIconImageResolver>)iconImageResolver
               initialViewModel:(nullable id<HUBViewModel>)initialViewModel HUB_DESIGNATED_INITIALIZER;

/**
 *  Notify the view model loader that an action was performed in the view that it is for
 *
 *  @param context The contextual object that the action was performed in
 *
 *  The view model loader uses this method to notify any action observing content operations
 *  that an action was performed.
 */
- (void)actionPerformedWithContext:(id<HUBActionContext>)context;


/**
 *  Load a view model using this loader regard less of reload policy
 */
- (void)loadViewModelRegardlessOfReloadPolicy;

@end

NS_ASSUME_NONNULL_END
