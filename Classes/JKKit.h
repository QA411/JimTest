//
//  JKKit.h
//  Pods
//
//  Created by Futao on 16/4/6.
//
//

#ifndef _JKKit_
#define _JKKit_

#ifndef USE_JKKIT
#define USE_JKKIT 1
#endif

#if USE_JKKIT_CORE
#import <JKKit/JKCore.h>
#endif

#if USE_JKKIT_PLUGINS
#import <JKKit/JKPlugins.h>
#endif

#if USE_JKKIT_CACHES
#import <JKKit/JKCaches.h>
#endif

#if USE_JKKIT_REFRESH
#import <JKKit/JKRefresh.h>
#endif

#if USE_JKKIT_HUD
#import <JKKit/JKHUD.h>
#endif

#if USE_JKKIT_VALIDATOR
#import <JKKit/JKValidator.h>
#endif

#if USE_JKKIT_SECURITY
#import <JKKit/JKSecurity.h>
#endif


#if USE_JKKIT_UIKIT
#import <JKUIKit/JKUIKit.h>
#endif


#endif /* _JKKit_ */
