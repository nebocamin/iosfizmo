/* GradientView.m: A view that just displays a color gradient
 for IosFizmo, an IosGlk port of the Fizmo Z-machine interpreter.
 Designed by Andrew Plotkin <erkyrath@eblong.com>
 http://eblong.com/zarf/glk/
 */

#import "GradientView.h"


@implementation GradientView

@synthesize numcolors;
@synthesize color0;
@synthesize color1;
@synthesize color2;
@synthesize color3;
@synthesize color4;

+ (Class) layerClass {
	return [CAGradientLayer class];
}

- (id) initWithCoder:(NSCoder *)decoder {
	self = [super initWithCoder:decoder];
	if (self) {
	}
	return self;
}

- (void) dealloc {
	self.color0 = nil;
	self.color1 = nil;
	self.color2 = nil;
	self.color3 = nil;
	self.color4 = nil;
	[super dealloc];
}

- (BOOL) hasColors {
	if (numcolors == 0)
		return NO;
	if (numcolors > 0 && !color0)
		return NO;
	if (numcolors > 1 && !color1)
		return NO;
	if (numcolors > 2 && !color2)
		return NO;
	if (numcolors > 3 && !color3)
		return NO;
	if (numcolors > 4 && !color4)
		return NO;
	return YES;
}

- (void) setUpColorsPreset:(int)val {
	switch (val) {
		case 1:
			self.color0 = [UIColor colorWithRed:1.0 green:0.992 blue:0.651 alpha:1];
			self.color1 = [UIColor colorWithRed:1.0 green:1.0 blue:0.500 alpha:1];
			self.color2 = [UIColor colorWithRed:0.976 green:0.980 blue:0.470 alpha:1];
			self.color3 = self.color1;
			self.color4 = self.color0;
			numcolors = 5;
			break;
		default:
			return;
	}
	
	self.backgroundColor = nil;

	CAGradientLayer *layer = (CAGradientLayer *)self.layer;

	layer.startPoint = CGPointMake(0.0, 0.5);
	layer.endPoint   = CGPointMake(1.0, 0.5);
	
	switch (numcolors) {
		case 2:
			layer.colors = [NSArray arrayWithObjects:
							(id)color0.CGColor, 
							(id)color1.CGColor, 
							nil];
			break;
			
		case 3:
			layer.colors = [NSArray arrayWithObjects:
							(id)color0.CGColor, 
							(id)color1.CGColor, 
							(id)color2.CGColor, 
							nil];
			break;
			
		case 4:
			layer.colors = [NSArray arrayWithObjects:
							(id)color0.CGColor, 
							(id)color1.CGColor, 
							(id)color2.CGColor, 
							(id)color3.CGColor, 
							nil];
			break;
			
		case 5:
			layer.colors = [NSArray arrayWithObjects:
							(id)color0.CGColor, 
							(id)color1.CGColor, 
							(id)color2.CGColor, 
							(id)color3.CGColor, 
							(id)color4.CGColor, 
							nil];
			break;
	}
}

@end
