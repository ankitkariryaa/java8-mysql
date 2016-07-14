INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('bike', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('germany', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('switzerland', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('autos', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('horses', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('zoo', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('squash', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('titanic', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('outfit', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('lebensraeume', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('tristram', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('lakeland', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('theplain', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');
INSERT INTO `mining__data` (`id`,`content_class_name`) VALUES ('kobebryant', 'de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('bike','Table name','Bike');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ("bike","Table description","<p>Daily bike rental statistics from capital bike share combined with weather and seasonal information.</p><p><b>Source:</b> The UCI Machine Learning Repository, http://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('bike','Data file','data_bike.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('bike','Attributes file','data_bike_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('bike','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('bike','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Table name','Socio-Economics of Germany');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Table description',"<p>Regional communities of Germany with aggregated socio-economic status as well as results of 2005 and 2009 federal elections.</p><br/><p><b>Authors:</b> Bo Kang, Te Zar Htun, Pavel Tokmakov, Maike Krause-Traudes, Mario Boley<br/><b>Source:</b> German Federal Statistical Office (destatis), www.destatis.de<p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Data file','data_germany.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Attributes file','data_germany_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Groups file','data_germany_attribute_groups.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('germany','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Table name','Swiss Migration Referendum');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ("switzerland","Table description","<p>Regional communities of Switzerland with their aggregated socio-economic status, results of 2011 national council election, and results of 2014 popular vote on a more restrictive immigration law.</p><p><b>Author:</b> Maike Krause-Traudes</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Data file','data_switzerland.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Attributes file','data_switzerland_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Groups file','data_switzerland_attribute_groups.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('switzerland','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Table name','WEKA 1985 auto imports');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Table description',"<p><b>Source: </b>WEKA example datasets, http://www.cs.waikato.ac.nz/ml/weka/datasets.html</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Data file','data_auto.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Attributes file','data_auto_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('autos','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Table name','WEKA horse colic cases');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Table description',"<p>Case collection of horse colics.</p><br /><p><b>Source: </b>WEKA example datasets, http://www.cs.waikato.ac.nz/ml/weka/datasets.html</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Data file','data_horses.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Attributes file','data_horses_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('horses','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Table name','WEKA zoo');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Table description',"<p><b>Source: </b>WEKA example datasets, http://www.cs.waikato.ac.nz/ml/weka/datasets.html</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Data file','data_zoo.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Attributes file','data_zoo_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('zoo','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Table name','WEKA squash quality');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Table description',"<p><b>Source: </b>WEKA example datasets, http://www.cs.waikato.ac.nz/ml/weka/datasets.html</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Data file','data_squash.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Attributes file','data_squash_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('squash','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Table name','Titanic');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Table description',"<p>Passenger records from the RMS Titanic.</p><br /><p><b>Source:</b> Kaggle competition: 'Titanic: Machine Learning from Disaster', https://www.kaggle.com/c/titanic/data</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Data file','data_titanic.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Attributes file','data_titanic_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('titanic','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Table name','Outfit 7 Survey');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Table description',"<p>Interviews of representative subset of German online users on brand and outfit questions.</p><br /><p><b>Source:</b> Outfit 7.0, Spiegel Surveys, www.spiegel-qc.de</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Data file','data_outfit.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Attributes file','data_outfit_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('outfit','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Table name','BBSR Quality of Life Survey');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Table description',"Interviews of representative subset of population of Germany (18 years and above) about attitudes, opinions, and knowledge of the resident population in their region.<p><br /><b>Source:</b> Opinion poll 'LebensRäume' 2011 conducted by the German Federal Institute for Research on Building, http://www.gesis.org/en/services/data-analysis/survey-data/living-space-lebensraeume/</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Data file','data_lebensraeume.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Attributes file','data_lebensraeume_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lebensraeume','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Table name','Tristram');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Table description',"<p>Socio-economic records sampled from the population of Tristram.</p><br /><p><b>Author:</b> Bo Kang</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Data file','data_tristram.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Attributes file','data_tristram_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('tristram','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Table name','Lakeland');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Table description',"<p>Socio-economic records sampled from the population of Lakeland.</p><br /><p><b>Author:</b> Bo Kang</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Data file','data_lakeland.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Attributes file','data_lakeland_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('lakeland','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Table name','The Plain');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Table description',"<p>Socio-economic records sampled from the population of The Plain.</p><br /><p><b>Author:</b> Bo Kang</p>");
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Data file','data_theplain.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Attributes file','data_theplain_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('theplain','Missing code','?');

INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Table name','Shots by Kobe Bryant in 2009/10');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Table description','');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Data file','data_kobe_bryant.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Attributes file','data_kobe_bryant_attributes.txt');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Delimeter',';');
INSERT INTO `mining__data_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('kobebryant','Missing code','?');


INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('creedo_default_system','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('cjs_demo_system','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('ass_sampling_forsied_postproc','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('ass_sampling_default_postproc','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('interactive_dssd_system','de.unibonn.creedo.webapp.dashboard.mining.DssdSystemBuilder');

INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('creedo_default_system','Algorithms','[ASSOCIATION_BEAMSEARCH, EXCEPTIONAL_MODEL_BEAMSEARCH, ASSOCIATION_SAMPLER, EMM_SAMPLER, DIVERSE_SUBGROUP_SET_DISCOVERY]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('creedo_default_system','Post processor','Default ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_demo_system','Algorithms','[CJS_DEMO_MINER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_demo_system','Post processor','Default ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_forsied_postproc','Algorithms','[ASSOCIATION_SAMPLER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_forsied_postproc','Post processor','Knowledge model ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_forsied_postproc','Show dialog','false');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_default_postproc','Algorithms','[ASSOCIATION_SAMPLER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_default_postproc','Post processor','Default ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('ass_sampling_default_postproc','Show dialog','false');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('interactive_dssd_system','Algorithms','[ASSOCIATION_SAMPLER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('interactive_dssd_system','Post processor','Default ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('interactive_dssd_system','Show dialog','false');
