Given(/^I have navigated to the webview screen$/) do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Buttons'
  end
  on(ViewsMenuScreen).webview
end

When(/^I click the text "(.*?)" in a webview$/) do |text|
  on(WebviewScreen).click_on_text text
end

Then(/^I should see the text "(.*?)" in a webview$/) do |text|
  on(WebviewScreen).should have_text(text)
end

When(/^I look for elements in the webview$/) do
  on(WebviewScreen) do |screen|
    screen.wait_for_text 'Welcome to Foundation'
    @webview = screen.web_view
  end
end

Then(/^I should know the following elements exist:$/) do |table|
  table.hashes.each do |hsh|
    @webview.should have_element(hsh['locator'], hsh['value'])
  end
end

When(/^I click on the anchor with the text "(.*?)"$/) do |text|
  @webview.click('textContent', text)
end

Then(/^I should be able to enter "(.*?)" into the text field$/) do |text|
  on(WebviewScreen).scroll_down
  @webview.enter_text('id', 'tf', text)
end
