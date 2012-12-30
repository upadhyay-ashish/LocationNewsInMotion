class HomeViewController < UIViewController

  HEADER_LABEL_TAG = 1
  CITY_TEXT_FIELD_TAG = 2
  BUTTON_TAG = 3
  ACTIVITY_INDICATOR_FRAME = [[140,100],[20,10]]
  LABEL_FRAME = [[120,110],[200,50]]
  ACTIVITY_VIEW_FRAME = [[0, 0], [320, 480]]
  LABEL_TEXT = 'Loading...'

  def loadView
    views = NSBundle.mainBundle.loadNibNamed "HomeViewController", owner:self, options:nil
    self.view = views[0]
    self.title = "New Search"
  end

  def viewDidLoad
    label_top
    text_field_city
    button_field_search
    tap_gesture_recognizer
    self.view.addGestureRecognizer(@tap_gesture_recognizer)
    p 'loaded view'
  end

  def label_top
    @label_top = self.view.viewWithTag HEADER_LABEL_TAG 
  end

  def text_field_city
    @text_field_city = self.view.viewWithTag CITY_TEXT_FIELD_TAG 
    @text_field_city.delegate = self
  end

  def button_field_search
    @button_field_search = self.view.viewWithTag BUTTON_TAG
    @button_field_search.addTarget(self, action:'search_news', forControlEvents:UIControlEventTouchUpInside)
  end

  def search_news
    self.view.addSubview(activity_indicator)
    self.view.addSubview(loading_label)
    self.view.addSubview(activity_view)
    p "searching webservice for news"
  end

  def activity_indicator
    @activityIndicator ||= begin
      activity_indicator = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhiteLarge)
      activity_indicator.frame = ACTIVITY_INDICATOR_FRAME
      activity_indicator.startAnimating
      activity_indicator
    end
  end

  def activity_view
    activity_view = UIView.new
    activity_view.frame = ACTIVITY_VIEW_FRAME
    activity_view.backgroundColor = UIColor.blackColor
    activity_view.alpha = 0.6
    activity_view
  end

  def loading_label
    @loading_label ||= begin
      loading_label           = UILabel.alloc.initWithFrame(LABEL_FRAME)
      loading_label.text      = LABEL_TEXT
      loading_label.textColor = UIColor.whiteColor
      loading_label.backgroundColor = UIColor.clearColor
      loading_label
    end
  end

  def dismissKeyboard(tap_gesture_recognizer)
    @text_field_city.resignFirstResponder
  end
  
  def tap_gesture_recognizer
    @tap_gesture_recognizer = UITapGestureRecognizer.alloc.initWithTarget(self,action:'dismissKeyboard:')
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    false
  end



end