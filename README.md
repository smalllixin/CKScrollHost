# CKScrollHost

This is a tool enable you use componentkit with scrollview.

That means you can composite the following things together into a scrollview.

[ComponentA] -- ModelA
[ComponentB] -- ModelB
[ComponentC] -- ModelC


*NOTE:*

This util depended on CKComponentHostingView. However, the hosting view in 0.13 ComponentKit's has some issues. 

To let it work correctly you have to modify the source of componentkit. 

Like this:
https://github.com/smalllixin/componentkit/commit/c57eda6216925f0050b418ca1c61f9fdb610fc72