//
// KeyboardManager.h
// https://github.com/hackiftekhar/IQKeyboardManager

/*!
	@enum IQAutoToolbarManageBehaviour
 
	@abstract AutoToolbar manage settings.

	@const IQAutoToolbarBySubviews Creates Toolbar according to subview's hirarchy of Textfield's in view.

	@const IQAutoToolbarByTag Creates Toolbar according to tag property of TextField's.
 */
typedef enum IQAutoToolbarManageBehaviour
{
	IQAutoToolbarBySubviews,
	IQAutoToolbarByTag,
	
}IQAutoToolbarManageBehaviour;

@protocol IQKeyBoardManagerDelegate <NSObject>
@optional
-(void)keyBoardWillShow;
-(void)keyboardWillHide;

@end

#import <Foundation/Foundation.h>

/*!
    @author Iftekhar Qurashi
 
	@related hack.iftekhar@gmail.com
 
    @class IQKeyboardManager
 
	@abstract Keyboard TextField/TextView Manager
 */
@interface IQKeyboardManager : NSObject

//增加了keyboard show and hidden 的时候delegate方法
@property (assign,nonatomic)id<IQKeyBoardManagerDelegate> delegate;

/*!
	@property keyboardDistanceFromTextField
 
	@abstract To set keyboard distance from textField. can't be less than zero. Default is 10.0.
 */
@property(nonatomic, assign) CGFloat keyboardDistanceFromTextField;

/*!
	@property enable
 
	@abstract enable/disable the keyboard manager. Default is YES.
 */
@property(nonatomic, assign, getter = isEnabled) BOOL enable;

/*!
    @property enableAutoToolbar
 
    @abstract Automatic manages the UIToolbar functionality. Default is NO.
 */
@property(nonatomic, assign, getter = isEnableAutoToolbar) BOOL enableAutoToolbar;

/*!
 @property resignOnTouchOutside
 
 @abstract Resigns Keyboard on touching outside of UITextField/View. Default is NO.
 */
@property(nonatomic, assign) BOOL shouldResignOnTouchOutside;

/*!
	@property toolbarManageStyle
 
	@abstract AutoToolbar managing behaviour. Default is IQAutoToolbarBySubviews.
 */
@property(nonatomic, assign) IQAutoToolbarManageBehaviour toolbarManageBehaviour;

/*!
	@method sharedManager
 
	@return Returns the default singleton instance.
 */
+ (IQKeyboardManager*)sharedManager;


/*!
	@method resignFirstResponder
 
	@abstract Resigns currently first responder field.
 */
- (void)resignFirstResponder;


/*!
    @method init
 
    @abstract Should create only one instance of class. Should not call init.
 */
- (id)init	__attribute__((unavailable("init is not available in IQKeyboardManager, Use class methods")));

/*!
    @method init
 
    @abstract Should create only one instance of class. Should not call new.
 */
+ (id)new	__attribute__((unavailable("new is not available in IQKeyboardManager, Use class methods")));

/*!
    @method topMostController
 
    @return Returns the current Top Most ViewController in hierarchy.
 */
+ (UIViewController*) topMostController;

/*!
    @method superScrollView:
 
    @return Returns the UIScrollView object if any found in view's upper hierarchy.
 */
+ (UIScrollView*)superScrollView:(UIView*)view;

-(void)setRootViewFrame:(CGRect)frame;

@end


/*!
	@category UIView (IQKeyboardToolbar)
 
    @since iOS (5.0 and later), ARC Required

    @abstract UIView category methods to add UIToolbar on UIKeyboard.
 */
@interface UIView (IQKeyboardToolbar)

/*!
    @method addDoneOnKeyboardWithTarget:action:
 
    @abstract Helper functions to add Done button on keyboard.
 
    @param target: Target object for selector. Usually 'self'.
 
    @param action: Done button action name. Usually 'doneAction:(UIBarButtonItem*)item'.
 */
- (void)addDoneOnKeyboardWithTarget:(id)target action:(SEL)action;


/*!
    @method addCancelDoneOnKeyboardWithTarget:cancelAction:doneAction:
 
    @abstract Helper function to add Cancel and Done button on keyboard.
 
    @param target: Target object for selector. Usually 'self'.
 
    @param cancelAction: Crevious button action name. Usually 'cancelAction:(UIBarButtonItem*)item'.
 
    @param doneAction: Done button action name. Usually 'doneAction:(UIBarButtonItem*)item'.
 */
- (void)addCancelDoneOnKeyboardWithTarget:(id)target cancelAction:(SEL)cancelAction doneAction:(SEL)doneAction;

/*!
    @method addPreviousNextDoneOnKeyboardWithTarget:previousAction:nextAction:doneAction
 
    @abstract Helper function to add SegmentedNextPrevious and Done button on keyboard.
 
    @param target: Target object for selector. Usually 'self'.
 
    @param previousAction: Previous button action name. Usually 'previousAction:(IQSegmentedNextPrevious*)segmentedControl'.
 
    @param nextAction: Next button action name. Usually 'nextAction:(IQSegmentedNextPrevious*)segmentedControl'.
 
    @param doneAction: Done button action name. Usually 'doneAction:(UIBarButtonItem*)item'.
 */
- (void)addPreviousNextDoneOnKeyboardWithTarget:(id)target previousAction:(SEL)previousAction nextAction:(SEL)nextAction doneAction:(SEL)doneAction;

/*!
    @method setEnablePrevious:next:
 
    @abstract Helper function to enable and disable previous next buttons.
 
    @param isPreviousEnabled: BOOL to enable/disable previous button on keyboard.
 
    @param isNextEnabled:  BOOL to enable/disable next button on keyboard..
 */
- (void)setEnablePrevious:(BOOL)isPreviousEnabled next:(BOOL)isNextEnabled;

@end


/*!
	@class IQSegmentedNextPrevious
 
    @since iOS (5.0 and later)
 
    @abstract Custom SegmentedControl for Previous/Next button.
 */
@interface IQSegmentedNextPrevious : UISegmentedControl
{
    id buttonTarget;
    SEL previousSelector;
    SEL nextSelector;
}

/*!
    @method initWithTarget:previousAction:nextAction:
 
    @abstract initialization function for IQSegmentedNextPrevious.
 
    @param target: Target object for selector. Usually 'self'.
 
    @param previousAction: Previous button action name. Usually 'previousAction:(IQSegmentedNextPrevious*)segmentedControl'.
 
    @param nextAction: Next button action name. Usually 'nextAction:(IQSegmentedNextPrevious*)segmentedControl'.
 */
-(id)initWithTarget:(id)target previousAction:(SEL)previousAction nextAction:(SEL)nextAction;

/*!
    @method init
 
    @abstract initWithTarget:previousAction:nextAction should be used.
 */
-(id)init	__attribute__((unavailable("init is not available, should use initWithTarget:previousAction:nextAction instead")));

/*!
    @method init
 
    @abstract initWithTarget:previousAction:nextAction should be used.
 */
+(id)new	__attribute__((unavailable("new is not available, should use initWithTarget:previousAction:nextAction instead")));

@end

