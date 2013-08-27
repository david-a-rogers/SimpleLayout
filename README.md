SimpleLayout:
=
A Simple Approach to View Layout in iOS
-
  
Any approach to layout should have the following attributes:

1. It should be easy and concise to write/create.
2. It should be understandable to read/maintain.
3. The resulting layout should respond well to changes in the parent's size.

The existing solutions for layout in iOS, the autoresizing mask and autolayout, fail in one or more respects in both their interface builder and programmatic aspects.  If the reasons don't immediately occur to you, google "autoresizingmask problems" or "auto layout limitations".

SimpleLayout takes a minimalist approach.  Like autolayout, it allows you to refer to the edges, center, width, and height of a view.  Unlike autolayout, it does so in a compact and readable form.

Here's a short example that lays out four controls:

```objective-c
-(void) viewWillLayoutSubviews {
    // === topSlider ===
    self.topSlider.width = self.view.width * .70;
    self.topSlider.centerX = self.view.centerX;
    self.topSlider.top = self.view.top + kSLEdgeStandardSpace;

    // === bottomSlider ===
    self.bottomSlider.width = self.view.width * .70;
    self.bottomSlider.centerX = self.view.centerX;
    self.bottomSlider.bottom = self.view.bottom - kSLEdgeStandardSpace;

    // Calculate the remaining vertical space
    CGFloat availableSpace = self.bottomSlider.top - self.topSlider.bottom;
    // Then subtract the height of the two labels
    availableSpace -= self.topLabel.height;
    availableSpace -= self.bottomLabel.height;

    // Divide the available space in three for each of the spaces.
    CGFloat oneSpace = availableSpace / 3;

    // === topLabel ===
    self.topLabel.top = self.topSlider.bottom + oneSpace;
    self.topLabel.centerX = self.view.centerX;

    // === bottomLabel ===
    self.bottomLabel.top = self.topLabel.bottom + oneSpace;
    self.bottomLabel.centerX = self.view.centerX;
}
```

The code is concise, but readable.  And if you take a look at the sample project, you can see that this code makes use of the view's current size to layout the subviews.

The SimpleLayout class and demo have the BSD license.  You can use SimpleLayout for free and commercial applications.

Download the project, or read the documentation to learn more.

SimpleLayout lives at https://github.com/david-a-rogers/SimpleLayout
