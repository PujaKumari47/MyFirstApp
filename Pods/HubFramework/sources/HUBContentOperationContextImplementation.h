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

#import "HUBContentOperationContext.h"
#import "HUBHeaderMacros.h"

NS_ASSUME_NONNULL_BEGIN

/// Concrete implementation of the `HUBContentOperationContext` API
@interface HUBContentOperationContextImplementation : NSObject <HUBContentOperationContext>

/**
 *  Initialize an instance of this class
 *
 *  @param viewURI The URI of the view that the content operation will be used in
 *  @param featureInfo An object containing information about the feature that the operation will be used in
 *  @param connectivityState The current connectivity state, as resolved by `HUBConnectivityStateResolver`
 *  @param viewModelBuilder The view model builder that the content operation should use
 *  @param previousError Any error encountered by a previous content operation in the view's content loading chain
 */
- (instancetype)initWithViewURI:(NSURL *)viewURI
                    featureInfo:(id<HUBFeatureInfo>)featureInfo
              connectivityState:(HUBConnectivityState)connectivityState
               viewModelBuilder:(id<HUBViewModelBuilder>)viewModelBuilder
                  previousError:(nullable NSError *)previousError HUB_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
