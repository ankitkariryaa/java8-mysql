INSERT INTO `content__pages` VALUES
  ("indexpage", "de.unibonn.creedo.ui.indexpage.DefaultIndexPageBuilder"),
  ("help1", "de.unibonn.creedo.ui.ContentPageBuilder"),
  ("info", "de.unibonn.creedo.ui.ContentPageBuilder"),
  ("citations", "de.unibonn.creedo.ui.ContentPageBuilder"),
  ("signuppage", "de.unibonn.creedo.boot.DefaultAccountRequestPageBuilder");

INSERT INTO `content__pages_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("indexpage", "Title", "Welcome to Creedo"),
  ("indexpage", "Reference name", "Home"),
  ("indexpage", "Content file name", "creedo_index_content.static.html"),
  ("indexpage", "Login invitation", "<a href=\"login.htm\">Log in</a> to see demo analytics dashboards..."),

  ("info", "Title", "Information"),
  ("info", "Reference name", "Info"),
  ("info", "Content file name", "content_info.html"),  

  ("citations", "Title", "Citation Requests"),
  ("citations", "Reference name", "Citations"),
  ("citations", "Content file name", "content_citation.html"),  

  ("help1", "Title", "Help page"),
  ("help1", "Reference name", "Help"),
  ("help1", "Content file name", "creedo_help_ui.static.html"),
  
  ("signuppage", "Account request note", "Provide your account credentials. Your account still has to be approved by a site administrator before it will become active. You will be notified via mail about the progress. Thank you.");
  
INSERT INTO `content__frames` VALUES
  ("mainframe", "de.unibonn.creedo.boot.DefaultMainFrameBuilder"),
  ("helpframe", "de.unibonn.creedo.boot.DefaultPageFrameBuilder");
  
INSERT INTO `content__frames_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("mainframe", "Navbar entries", "[info]"),
  ("mainframe", "Footer entries", "[citations]"),
  
  ("helpframe", "Navbar entries", "[help1]"),
  ("helpframe", "Footer entries", "[]");
  
INSERT INTO `content__demos` VALUES
  ("cjs_bike", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("germany2010", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("switzerland2014", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("titanic", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("outfit", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("living", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder"),
  ("kobebryant", "de.unibonn.creedo.ui.indexpage.DashboardLinkBuilder");
    
INSERT INTO `content__demos_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_bike", "Title", "Casual discoveries"),
  ("cjs_bike", "Description", "Bike rental companies rent out bikes to both regular and to casual users. What are the patterns in their habits? Find out with user-friendly subgroup discovery based on the novel <a href='http://eda.mmci.uni-saarland.de/cjs'>Cumulative Jensen Shannon</a> divergence - without having to guess any data-specific parameters."),
  ("cjs_bike", "Image", "demo_bike.jpg"),
  ("cjs_bike", "Image credits", "Image: www.flickr.com/photos/mgobbi/3149358543/ (CC BY 2.0)"),
  ("cjs_bike", "Analytics dashboard", "cjs_demo_system"),
  ("cjs_bike", "Data", "bike"),
  
  ("germany2010", "Title", "Political volatility"),
  ("germany2010", "Description",  "While Germany's Free Democrats suffered a terrible blow in the last federal election, they had been at an all time high in the previous term. What were the reasons for the impressive increase between 2005 and 2009 - and did they perhaps already contain the seed for the future downfall?"),
  ("germany2010", "Image", "fdp-heissluft-s.png"),
  ("germany2010", "Image credits", "Courtesies for picture: Wikimedia Commons / 4028mdk09"),
  ("germany2010", "Analytics dashboard", "creedo_default_system"),
  ("germany2010", "Data", "germany"),
  
  ("switzerland2014", "Title", "&quot;Stop mass immigration!&quot;"),
  ("switzerland2014", "Description", "Swiss citizens decided to cap immigration in February 2014 - but what exactly happened? Who backed the measure and which communities opposed it? Figure it out!"),
  ("switzerland2014", "Image", "swiss-wall.png"),
  ("switzerland2014", "Image credits", "Courtesies for picture: FreeDigitalPhotos.net / criminalatt"),
  ("switzerland2014", "Analytics dashboard", "creedo_default_system"),
  ("switzerland2014", "Data", "switzerland"),
  
  ("titanic", "Title", "The tragedy of the Titanic"),
  ("titanic", "Description", "It is the world's most famous sea tragedy: the largest ship of her time sank at her maiden voyage. Thousands of passengers found death in the arctic sea. But chances to survive were not equal for all passengers. Who should have better stayed at home?"),
  ("titanic", "Image", "titanic-grey.png"),
  ("titanic", "Image credits", "Courtesies for picture: Wikimedia Commons / PD UK"),
  ("titanic", "Analytics dashboard", "creedo_default_system"),
  ("titanic", "Data", "titanic"),
  
  ("outfit", "Title", "Outfit survey"),
  ("outfit", "Description", "Who spends on self representation and who just on avoiding to feel cold in winter? Use ocm to analyse \"Outfit 7.0 2011\" survey data. It is the largest media market survey of the German fashion market and focuses on the needs, habits, and attitudes of consumers."),
  ("outfit", "Image", "outfitDataset-s.png"),
  ("outfit", "Image credits", "Courtesies for picture: FreeDigitalPhotos.net / Serge Bertasius Photography"),
  ("outfit", "Analytics dashboard", "creedo_default_system"),
  ("outfit", "Data", "outfit"),
  
  ("living", "Title", "Living conditions"),
  ("living", "Description",  "Since the German reunification, the living conditions in eastern and western Germany are getting more and more equal due to subsidies. But besides, what kind of living conditions make people to be more content or unhappy with their lives?"),
  ("living", "Image", "lebensraeume.png"),
  ("living", "Image credits", "Courtesies for picture: FreeDigitalPhotos.net / Serge Bertasius Photography"),
  ("living", "Analytics dashboard", "creedo_default_system"),
  ("living", "Data", "lebensraeume"),
  
  ("kobebryant", "Title", "Kobe Bryant"),
  ("kobebryant", "Description",  "Kobe Bryant is one of the most popular and most divisive active basketball players. Analyse the shots he attempted in 2009/10 NBA season, when he won his latest title. If you like him, you can focus on the shots Kobe made to show that he is the greatest player ever, or on his missed shots to prove otherwise."),
  ("kobebryant", "Image", "kobe_bryant_2010.jpg"),
  ("kobebryant", "Image credits", "Image: www.flickr.com/photos/jiazi/4842934207/ (CC BY-SA 2.0)"),
  ("kobebryant", "Analytics dashboard", "interactive_dssd_system"),
  ("kobebryant", "Data", "kobebryant");
 