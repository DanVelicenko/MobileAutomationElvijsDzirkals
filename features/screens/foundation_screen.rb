class FoundationScreen

  def initialize
    @foundation_titles = Elements.new(:id, 'tvProductTitle')
    @foundation_products = Elements.new(:id, '//*[@class="android.view.ViewGroup"][child::*[@resource-id="com.view9.foreveryng:id/tbLove"]]')
    @add_to_wishlist_buttons = Elements.new(:id, 'tbLove')
    @back_button = Elements.new(:xpath, '//android.widget.ImageButton[@content-desc="Navigate up"]')
    @wishlist_items_titles = Elements.new(:id, 'tvProductTitle')
  end

  def add_items_to_wishlist
    @added_products = []
    @add_to_wishlist_buttons.click_every_element_in_the_list
    product_titles = @foundation_titles.get_multiple_elements
    p "----- Items added to wishlist -----"
    product_titles.each_index do |index|
      @added_products.push(product_titles[index].text)
      p product_titles[index].text
    end
    p "----- End of added wishlist items -----"
  end

  def verify_wishlist_items
    checked_items = []
    wishlist_items = @wishlist_items_titles.get_multiple_elements
    p "----- Items in wishlist -----"
    wishlist_items.each_index do |index|
      checked_items.push wishlist_items[index].text
      p wishlist_items[index].text
    end
    p "----- End of wishlist items -----"
    raise "Wishlist does not contain the same items as added: \n Expected: #{@added_products}\nActual: #{checked_items}"  unless checked_items == @added_products
    end

    def click_back_button
      @back_button.click
    end

end