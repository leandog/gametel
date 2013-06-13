Given(/^I have navigated to the webview screen$/) do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Buttons'
  end
  on(ViewsMenuScreen) do |screen|
    screen.webview
#    screen.wait_for_text 'Google Apps for Android'
  end
end

When(/^I click the text "(.*?)"  in a webview$/) do |text|
  on(WebviewScreen).click_on_text text
end

Then(/^I should see the text "(.*?)" in a webview$/) do |text|
  on(WebviewScreen) do |screen|
    screen.wait_for_text text
    screen.should have_text text
  end
end
