class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    home_controller = HomeViewController.new
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = home_controller
    @window.makeKeyAndVisible
    true
  end
end
