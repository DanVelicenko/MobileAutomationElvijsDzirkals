class MainScreen

  def initialize
    @burger_menu_button = Elements.new(:xpath, '//*[@resource-id="com.view9.foreveryng:id/layoutToolbar"]//android.widget.ImageButton')
    @overflow_menu_button = Elements.new(:id, 'action_overflow_menu')
    @overflow_menu_items = Elements.new(:id, 'content')
    @first_menu_button = Elements.new(:xpath, '//*[@class="android.widget.LinearLayout"][child::*[@resource-id="com.view9.foreveryng:id/title"]]')
    @wishlist_entry = Elements.new(:xpath, '//*[contains(@text,"Wishlist")][parent::*[@class="android.widget.RelativeLayout"]]')
    @my_profile_entry = Elements.new(:xpath, '//*[@resource-id="com.view9.foreveryng:id/title"][lower-case(@text)="my profile"]')
  end

  def click_first_menu_button
    first_menu_button = @first_menu_button.get_multiple_elements
    first_menu_button[0].click
  end

  def click_overflow_menu_button
    @overflow_menu_button.click
  end

  def click_log_in_button
    # Log in button doesn't have a text field, might be a bug with appium , sadly we have to use and index here,
    # but that is a really bad practice, since if a new entry gets created our tests would continue and we would get no error
    overflow_menu_items = @overflow_menu_items.get_multiple_elements
    overflow_menu_items[6].click
  end

  def click_my_profile_button
    @my_profile_entry.click
  end

  def click_wishlist_button
    @wishlist_entry.click
  end

end