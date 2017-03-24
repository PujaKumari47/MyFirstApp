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

#import "HUBActionContextImplementation.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HUBActionContextImplementation

@synthesize trigger = _trigger;
@synthesize customActionIdentifier = _customActionIdentifier;
@synthesize customData = _customData;
@synthesize featureInfo = _featureInfo;
@synthesize viewURI = _viewURI;
@synthesize viewModel = _viewModel;
@synthesize componentModel = _componentModel;
@synthesize viewController = _viewController;

- (instancetype)initWithTrigger:(HUBActionTrigger)trigger
         customActionIdentifier:(nullable HUBIdentifier *)customActionIdentifier
                     customData:(nullable NSDictionary<NSString *, id> *)customData
                    featureInfo:(id<HUBFeatureInfo>)featureInfo
                        viewURI:(NSURL *)viewURI
                      viewModel:(id<HUBViewModel>)viewModel
                 componentModel:(nullable id<HUBComponentModel>)componentModel
                 viewController:(UIViewController *)viewController
{
    NSParameterAssert(featureInfo != nil);
    NSParameterAssert(viewURI != nil);
    NSParameterAssert(viewModel != nil);
    NSParameterAssert(viewController != nil);

    self = [super init];
    
    if (self) {
        _trigger = trigger;
        _customActionIdentifier = customActionIdentifier;
        _customData = customData;
        _featureInfo = featureInfo;
        _viewURI = viewURI;
        _viewModel = viewModel;
        _componentModel = componentModel;
        _viewController = viewController;
    }
    
    return self;
}

@end

NS_ASSUME_NONNULL_END
