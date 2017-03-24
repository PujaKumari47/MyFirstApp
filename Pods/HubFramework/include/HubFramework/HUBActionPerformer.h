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

#import <Foundation/Foundation.h>

@class HUBIdentifier;

NS_ASSUME_NONNULL_BEGIN

/**
 *  Protocol defining the public API of an object that performs Hub Framework actions
 *
 *  You use this API to manually perform actions from either a component (conforming to
 *  `HUBComponentActionPerformer`) or content operation (conforming to
 *  `HUBContentOperationActionPerformer`).
 *
 *  Actions are used to define custom behavior and/or to communicate between the parts
 *  that make up a Hub Framework-powered view.
 *
 *  You don't conform to this protocol yourself. Instead, the Hub Framework will assign
 *  an object conforming to this protocol to the `actionPerformer` property of either a
 *  component or content operation.
 */
@protocol HUBActionPerformer <NSObject>

/**
 *  Perform an action with a given identifier, optionally passing custom data as well
 *
 *  @param identifier The identifier of the action to perform. Will be resolved to a
 *         `HUBAction` if matching a `HUBActionFactory` registered with `HUBActionRegistry`
 *         for the given identifier's namespace part.
 *  @param customData Any custom data to send to the action. Will be available on the
 *         `HUBActionContext` passed to the action when performed.
 *
 *  @return A boolean indicating whether the action was successfully performed or not.
 *          `NO` will be returned if either no action could be created for the given
 *          identifier, or if the resolved action returned `NO` when being performed.
 */
- (BOOL)performActionWithIdentifier:(HUBIdentifier *)identifier
                         customData:(nullable NSDictionary<NSString *, id> *)customData NS_SWIFT_NAME(performAction(withIdentifier:customData:));

@end

NS_ASSUME_NONNULL_END
