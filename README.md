# BoardNews READ ME

Team Members: Shiuan Chen(Serina), Bernardo Bustamante, JianQiao Xie

Our IOS app, BoardNews is about reading news, shopping, and checking the weather.

Users will be able to do the following functionalities: 
Read recent headline news derived from the open-source News API,
Shop/buy some cosmetic products and
Check weather from the weather API

Issues:
-For news API on the landing page, some cells on news are left blank and have duplicated images. I checked the issue regarding to that. I found out that the images downloaded are very fast that it 'loads up' before the app starts running to display on the TableView cell. As a result, it's displaying blank info with duplicated images. Other than that, API call works well, the news cell works fine and the WebView loads perfectly.
