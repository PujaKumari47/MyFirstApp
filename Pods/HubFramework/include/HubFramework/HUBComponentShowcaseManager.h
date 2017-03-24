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

#import <UIKit/UIKit.h>

@protocol HUBComponentModelBuilder;
@protocol HUBComponentShowcaseSnapshotGenerator;
@class HUBIdentifier;

NS_ASSUME_NONNULL_BEGIN

/**
 *  Protocol defining the public API of a Hub Framework component showcase manager
 *
 *  You interact with this API to build showcase functionality for available components in this instance of the
 *  Hub Framework. Normally, you don't call it from production code (although there is no harm in doing so), but
 *  rather use it to build tooling on top of the framework.
 *
 *  The Hub Framework does not provide any built-in functionality for showcases, besides providing the component
 *  identifiers that have been declared as showcasable, and the ability to create snapshot images of a component
 *  instance, for showcase purposes.
 *
 *  You don't conform to this protocol yourself, instead the application's `HUBManager` comes setup with a
 *  showcase manager that you can use.
 */
@protocol HUBComponentShowcaseManager <NSObject>

/**
 *  The component identifiers that have been declared as showcaseable
 *
 *  It's up to each component factory that has been registered with `HUBComponentRegistry` to (optionally) declare
 *  an array of showcaseable component names (by conforming to `HUBComponentFactoryShowcaseNameProvider`), which
 *  will then be used to construct the component identifiers returned from this property.
 */
@property (nonatomic, strong, readonly) NSArray<HUBIdentifier *> *showcaseableComponentIdentifiers;

/**
 *  Return a human readable name for a component that can be displayed in a showcase
 *
 *  @param componentIdentifier The identifier of the component to return a showcase name for
 *
 *  @return A component name that can be displayed in a showcase UI, or nil if the identifier wasn't recognized
 *          by any component factory.
 */
- (nullable NSString *)showcaseNameForComponentIdentifier:(HUBIdentifier *)componentIdentifier;

/**
 *  Create a new component model builder that is also able to generate showcase snapshots
 *
 *  You can mutate the returned builder to reflect what kind of component & content you wish to generate a snapshot
 *  with, then ask the builder to generate a snapshot. Snapshots can be used when implementing showcases for components
 *  or in tooling associated with the Hub Framework.
 */
- (id<HUBComponentModelBuilder, HUBComponentShowcaseSnapshotGenerator>)createShowcaseSnapshotComponentModelBuilder;

@end

NS_ASSUME_NONNULL_END
