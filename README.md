This is a collection of Cocoa vs Cappuccino comparison applications. Every 'feature folder' contains two the same applications. One for Cocoa, suffixed with -objc; the other Cappuccino  suffixed with -objj.

# Usage

The Cocoa applications should work (on 10.6) without any modification. The Cappuccino applications require a framework directory to function. If you build your own version of the Cappuccino source ($CAPP_BUILD is defined), frameworks can be symlinked using:

    capp gen -lf

If you've got a regular Cappuccino distribution the frameworks can be copied using:

    capp gen -f

# Goal

A large part of Cappuccino development is reverse engineering Cocoa behaviors. I used to shy away from testing Cocoa behavior extensively for small issues because it required setting up a completely new Cocoa application. 

This project aims to be a collection of as many comparison applications as possible. This will remove the hassle of setting up a completely new project, allowing for easy and quick reference tests.