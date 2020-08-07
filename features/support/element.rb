class Elements

  def initialize(type, value)
    @type = type
    @value = value
  end

  def get_element(timeout: 15)
    wait_opts = {
        timeout: timeout,
        interval: 0.2,
        message: "Element not found! @type: #{@type}, @value: #{@value}, timeout: #{timeout}"
    }
    $driver.wait(wait_opts) {
      return $driver.find_element(@type, @value)
    }
  end

  def get_multiple_elements(timeout: 15)
    wait_opts = {
        timeout: timeout,
        interval: 0.2,
        message: "Element not found! @type: #{@type}, @value: #{@value}, timeout: #{timeout}"
    }
    $driver.wait(wait_opts) {
      elements = $driver.find_elements(@type, @value)
      return elements if elements.length > 0
      raise "No elements were found by these parameters!"
    }
  end

  def get_text(timeout: 15)
    return get_element(timeout: timeout).text
  end

  def click(timeout: 15)
    wait_opts = {
        timeout: timeout,
        interval: 0.2,
        message: "Element not found! @type: #{@type}, @value: #{@value}, timeout: #{timeout}"
    }
    $driver.wait(wait_opts) {
      $driver.find_element(@type, @value).click
    }
  end

  def click_every_element_in_the_list(timeout: 15)
    el_list = get_multiple_elements(timeout: timeout)
    el_list.each_with_index do |el, index|
      wait_opts = {
          timeout: timeout,
          interval: 0.2,
          message: "Could not click element number #{index+1} in this list, @type: #{@type}, @value: #{@value}, timeout: #{timeout}"
      }
      $driver.wait(wait_opts) {
        el.click
      }
    end
  end

  def set(text, timeout: 15)
    wait_opts = {
        timeout: timeout,
        interval: 0.2,
        message: "Element not found! @type: #{@type}, @value: #{@value}, timeout: #{timeout}"
    }
    $driver.wait(wait_opts) {
      $driver.find_element(@type, @value).send_keys(text)
      $driver.hide_keyboard
    }
  end
end