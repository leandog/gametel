Given(/^I have navigated to the webview screen$/) do
  on(WebviewMainScreen).goto_webview
end

When(/^I click the text "(.*?)"  in a webview$/) do |text|
  on(WebviewScreen).click_on_webview_text text
end

Then(/^I should see the text "(.*?)" in a webview$/) do |text|
  on(WebviewScreen).wait_for_text text
end
