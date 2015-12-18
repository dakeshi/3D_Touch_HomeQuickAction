# 3D_Touch_HomeQuickAction
3D touch home quick action(dynamic quick action) Demo.

- API availablity check
- Handle quick action in application:didFinishLaunchingWithOptions method
- Different rootViewcontroller depends on quick action


# Why Dynamic Quick action?
Static quick action has some limitations. It works immediately when the app installed. If your app has tutorial/intro pages or initial data download logic when the app launch at first time, users won't see those views with static quick action.

With dynamic quick action, you can avoid these situations.
The quick action menu will be enabled after first app launch.

# How to test and debug quick action with device?

1) click edit scheme and check "wait for excutable to be lanched" option :

![edit scheme](http://dakeshi.github.io/assets/images/edit_scheme.png)

2) set breakpoint where you want to test :

![set breakpoint](http://dakeshi.github.io/assets/images/set_break.png)

3) input log message or debugger command and check "Automatically continue after evaluating actions" in edit breakpoint :

![edit breakpoint](http://dakeshi.github.io/assets/images/edit_break.png)
