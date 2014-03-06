#import "OCBorghettiView.h"

@interface OCBorghettiView ()
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, assign) NSInteger numberOfSections;
@property (nonatomic, assign) BOOL shouldAnimate;
@property (nonatomic, assign) BOOL hasBorder;
@end

@implementation OCBorghettiView

@synthesize accordionSectionBorderColor = _accordionSectionBorderColor;

#pragma mark - Public

#pragma mark View lifecycle

- (id)init
{
    @throw [NSException exceptionWithName:@"BadInitCall"
                                   reason:@"Initialize with initWithFrame: selector instead."
                                 userInfo:nil];
    
    return nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        [self initBorghetti];
    
    return self;
}

#pragma mark Add Section and View

- (void)addSectionWithTitle:(NSString *)sectionTitle
                    andView:(id)sectionView
{
    UIButton *section = [[UIButton alloc] init];
    
    [section setBackgroundColor:self.accordionSectionColor];
    [section setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [section setAutoresizesSubviews:YES];
    [section setAdjustsImageWhenHighlighted:NO];
    [section setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [section setTitle:sectionTitle forState:UIControlStateNormal];
    [section.titleLabel setFont:self.accordionSectionFont];
    [section setTitleColor:self.accordionSectionTitleColor
                  forState:UIControlStateNormal];
    
    [sectionView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [sectionView setAutoresizesSubviews:YES];
    
    [self.sections addObject:section];
    [self.views addObject:sectionView];
    
    [self addSubview:section];
    [self addSubview:sectionView];
    
    [section setTag:self.sections.count - 1];
    [section addTarget:self
                action:@selector(sectionSelected:)
      forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark Setter

- (void)setAccordionSectionBorderColor:(UIColor *)accordionSectionBorderColor
{
    _accordionSectionBorderColor = accordionSectionBorderColor;
    self.hasBorder = YES;
}

- (void)setAccordionActiveSection:(NSInteger)accordionActiveSection
{
    if (accordionActiveSection >= 0 && accordionActiveSection < self.sections.count) {
        if ([self.delegate respondsToSelector:@selector(accordion:willSelectView:withTitle:)]) {
            [self.delegate accordion:self
                      willSelectView:self.views[accordionActiveSection]
                           withTitle:[[self.sections[accordionActiveSection] titleLabel] text]];
        }
        
        if ([self.delegate respondsToSelector:@selector(accordion:shouldSelectView:withTitle:)] &&
            [self.delegate accordion:self
                    shouldSelectView:self.views[accordionActiveSection]
                           withTitle:[[self.sections[accordionActiveSection] titleLabel] text]] == NO) return;
        
        _accordionActiveSection = accordionActiveSection;
        [self setNeedsLayout];
        
        if ([self.delegate respondsToSelector:@selector(accordion:didSelectView:withTitle:)]) {
            [self.delegate accordion:self
                       didSelectView:self.views[self.accordionActiveSection]
                           withTitle:[[self.sections[self.accordionActiveSection] titleLabel] text]];
        }
    }
}

#pragma mark - Private

- (void)initBorghetti
{
    self.views = [NSMutableArray new];
    self.sections = [NSMutableArray new];
    
    self.accordionSectionHeight = 30;
    self.accordionSectionColor = [UIColor blackColor];
    self.accordionSectionFont = [UIFont fontWithName:@"Arial-BoldMT" size:16];
    self.accordionSectionTitleColor = [UIColor whiteColor];
    self.accordionSectionBorderColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
    self.hasBorder = NO;
    
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    self.autoresizesSubviews = YES;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.shouldAnimate = NO;
}

- (void)sectionSelected:(id)sender
{
    self.accordionActiveSection = [sender tag];
}

- (void)didAddSubview:(UIView *)subview
{
    if (![subview isKindOfClass:[UIButton class]])
        self.numberOfSections += 1;
}

- (void)layoutSubviews
{
    int height = 0;
    
    for (int i = 0; i < self.views.count; i++) {
        UIButton *sectionTitle = self.sections[i];
        id sectionView = self.views[i];
        
        CGRect sectionTitleFrame = [sectionTitle frame];
        sectionTitleFrame.origin.x = 0;
        sectionTitleFrame.size.width = self.frame.size.width;
        sectionTitleFrame.size.height = self.accordionSectionHeight;
        [sectionTitle setFrame:sectionTitleFrame];
        
        [sectionTitle setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, -5.0f, 0.0f, 0.0f)];
        [sectionTitle setImageEdgeInsets:UIEdgeInsetsMake(0.0f, self.frame.size.width - 25.0f , 0.0f, 0.0f)];
        
        CGRect sectionViewFrame = [sectionView frame];
        sectionViewFrame.origin.x = 0;
        sectionViewFrame.size.width = self.frame.size.width;
        sectionViewFrame.size.height = (self.frame.size.height - (self.numberOfSections * self.accordionSectionHeight));
        [sectionView setFrame:sectionViewFrame];
        
        sectionTitleFrame.origin.y = height;
        height += sectionTitleFrame.size.height;
        sectionViewFrame.origin.y = height;
        
        if (self.accordionActiveSection == i) {
            [sectionTitle setImage:[UIImage imageNamed:@"OCBorghettiView.bundle/icon_down_arrow.png"]
                          forState:UIControlStateNormal];
            
            sectionViewFrame.size.height = (self.frame.size.height - (self.numberOfSections * self.accordionSectionHeight));
            [sectionView setFrame:CGRectMake(0, sectionViewFrame.origin.y, self.frame.size.width, 0)];
            
            if ([sectionView respondsToSelector:@selector(setScrollsToTop:)])
                [sectionView setScrollsToTop:YES];
        } else {
            [sectionTitle setImage:[UIImage imageNamed:@"OCBorghettiView.bundle/icon_right_arrow.png"]
                          forState:UIControlStateNormal];
            
            sectionViewFrame.size.height = 0;
            
            if ([sectionView respondsToSelector:@selector(setScrollsToTop:)])
                [sectionView setScrollsToTop:NO];
        }
        
        [self processBorder:sectionTitle atIndex:i];
        
        height += sectionViewFrame.size.height;
        
        if ([sectionView respondsToSelector:@selector(setClipsToBounds:)])
            [sectionView setClipsToBounds:YES];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:self.shouldAnimate ? 0.1f : 0.0f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [sectionTitle setFrame:sectionTitleFrame];
        [sectionView setFrame:sectionViewFrame];
        [UIView commitAnimations];
    }
    
    self.shouldAnimate = YES;
}

- (void)processBorder:(UIButton *)sectionTitle
              atIndex:(NSInteger)index
{
    if (self.hasBorder) {
        if (index > 0) {
            UIView *topBorder = [[UIView alloc] init];
            topBorder.frame = CGRectMake(0.0f, 0.0f, sectionTitle.frame.size.width, 1.5f);
            topBorder.backgroundColor = self.accordionSectionBorderColor;
            topBorder.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            if (sectionTitle.subviews.count < 3) [sectionTitle addSubview:topBorder];
        }
    }
}

@end
