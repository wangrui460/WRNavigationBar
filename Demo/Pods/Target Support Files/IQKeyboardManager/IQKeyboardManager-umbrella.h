#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "IQUIScrollView+Additions.h"
#import "IQUITextFieldView+Additions.h"
#import "IQUIView+Hierarchy.h"
#import "IQUIViewController+Additions.h"
#import "IQUIWindow+Hierarchy.h"
#import "IQKeyboardManagerConstants.h"
#import "IQTextView.h"
#import "IQBarButtonItem.h"
#import "IQPreviousNextView.h"
#import "IQTitleBarButtonItem.h"
#import "IQToolbar.h"
#import "IQUIView+IQKeyboardToolbar.h"

FOUNDATION_EXPORT double IQKeyboardManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char IQKeyboardManagerVersionString[];

