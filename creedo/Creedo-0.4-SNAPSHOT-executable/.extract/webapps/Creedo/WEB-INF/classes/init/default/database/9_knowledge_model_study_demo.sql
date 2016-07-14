# INSERT INTO `user` VALUES (2, 'governor1@tristram.gov', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');
# INSERT INTO `user` VALUES (3, 'governor2@tristram.gov', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');
# INSERT INTO `user` VALUES (4, 'jane@realkd.org', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');
# INSERT INTO `user` VALUES (5, 'joe@realkd.org', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');
# INSERT INTO `user` VALUES (6, 'berta@realkd.org', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');
# INSERT INTO `user` VALUES (7, 'bob@realkd.org', '$2a$12$xaR9ZG7V45zwO5IROjvxC./FVFUXqAQc9m3TfqWfzlUy.ZffgMptG', 0, 1, 0, 0, '2014-05-01 11:00:00');

INSERT INTO `admin__users` VALUES
  ("governor1@tristram.gov", "de.unibonn.creedo.admin.users.ExampleUserDetails"),
  ("governor2@tristram.gov", "de.unibonn.creedo.admin.users.ExampleUserDetails"),
  ("jane@realkd.org", "de.unibonn.creedo.admin.users.ExampleUserDetails"),
  ("joe@realkd.org", "de.unibonn.creedo.admin.users.ExampleUserDetails"),
  ("berta@realkd.org", "de.unibonn.creedo.admin.users.ExampleUserDetails"),
  ("bob@realkd.org", "de.unibonn.creedo.admin.users.ExampleUserDetails");
  
# INSERT INTO `admin__users_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
#  ("governor1@tristram.gov", "Groups", "[EXAMPLE]"),
#  ("governor2@tristram.gov", "Groups", "[EXAMPLE]"),
#  ("jane@realkd.org", "Groups", "[EXAMPLE]"),
#  ("joe@realkd.org", "Groups", "[EXAMPLE]"),
#  ("berta@realkd.org", "Groups", "[EXAMPLE]"),
#  ("bob@realkd.org", "Groups", "[EXAMPLE]");

INSERT INTO `content__study_designs` VALUES
  ("forsied_2x2_design", "de.unibonn.creedo.studies.designs.StudyDesignBuilder");
INSERT INTO `content__study_designs_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("forsied_2x2_design", "Name", "FORSIED 2x2 design"),
  ("forsied_2x2_design", "Description",  "This design aims to evaluate whether the FORSIED-based knowledge model helps users to discover an expressive set of association patterns faster than with a standard system."),
  ("forsied_2x2_design", "System Specifications", "[forsied_target_system, forsied_control_system]"),
  ("forsied_2x2_design", "Task Specifications", "[forsied_task_lakeland, forsied_task_theplain]"),
  ("forsied_2x2_design", "Assignment Scheme", "TWO_PHASE_ASSIGNMENT"),
  ("forsied_2x2_design", "Evaluation task filter", "UNKNOWN_TASKS");
  
INSERT INTO `content__studies` VALUES
  ("forsied_demo_study", "de.unibonn.creedo.studies.StudyBuilder");
INSERT INTO `content__studies_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("forsied_demo_study", "Name", "Socio-economics of an ancient land"),
  ("forsied_demo_study", "Description", "<p>Use data mining techniques, discover insights about the socio-economic status of an ancient land.</p> <p>This study demostrate the usage of Creedo for model evaluation.</p>"),
  ("forsied_demo_study", "ImgUrl", "km-db-link.jpg"),
  ("forsied_demo_study", "ImgCredits", "Courtesies for picture: Skyrim - The Elder Scrolls V"),
  ("forsied_demo_study", "Design", "forsied_2x2_design"),
  ("forsied_demo_study", "State", "SETUP"),
  ("forsied_demo_study", "Participants", "[bob@realkd.org,berta@realkd.org,joe@realkd.org,jane@realkd.org]"),
  ("forsied_demo_study", "Evaluators", "[bob@realkd.org,berta@realkd.org,joe@realkd.org,jane@realkd.org]");
  
INSERT INTO `content__study_system_specifications` VALUES 
  ("forsied_target_system", "de.unibonn.creedo.studies.designs.SystemSpecBuilder"),
  ("forsied_control_system", "de.unibonn.creedo.studies.designs.SystemSpecBuilder");
INSERT INTO `content__study_system_specifications_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("forsied_target_system", "Name", "Target System"),
  ("forsied_target_system", "Description", "System with Knowledge Model."),
  ("forsied_target_system", "Analytics Dashboard Builder", "ass_sampling_forsied_postproc"), 
  
  ("forsied_control_system", "Name", "Control System"),
  ("forsied_control_system", "Description", "System without Knowledge Model."),
  ("forsied_control_system", "Analytics Dashboard Builder", "ass_sampling_default_postproc"); 
  
INSERT INTO `content__study_task_specifications` VALUES
  ("forsied_task_lakeland", "de.unibonn.creedo.studies.designs.TaskSpecBuilder"),
  ("forsied_task_theplain", "de.unibonn.creedo.studies.designs.TaskSpecBuilder");
INSERT INTO `content__study_task_specifications_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("forsied_task_lakeland", "Name", "First task of FORSIED study."),
  ("forsied_task_lakeland", "Description",  "Participants try to find informative set of 3 patterns about Lakeland."),
  ("forsied_task_lakeland", "Instructions", "[study_lakeland_trial_inst_1.html,study_lakeland_trial_inst_2.html]"),
  ("forsied_task_lakeland", "Result definition", "Pattern set of all stored patterns is single result"),
  ("forsied_task_lakeland", "Max. number of patterns", "3"),
  ("forsied_task_lakeland", "Min. number of patterns", "3"),
  ("forsied_task_lakeland", "Input", "lakeland"),
  ("forsied_task_lakeland", "Evaluation Scheme", "forsied_eval_lakeland"), 
  
  ("forsied_task_theplain", "Name", "Second task of FORSIED study."),
  ("forsied_task_theplain", "Description",  "Participants try to find informative set of 3 patterns about The Plains."),
  ("forsied_task_theplain", "Instructions", "[study_theplain_trial_inst_1.html,study_theplain_trial_inst_2.html]"),
  ("forsied_task_theplain", "Result definition", "Pattern set of all stored patterns is single result"),
  ("forsied_task_theplain", "Max. number of patterns", "3"),
  ("forsied_task_theplain", "Min. number of patterns", "3"),
  ("forsied_task_theplain", "Input", "theplain"),
  ("forsied_task_theplain", "Evaluation Scheme", "forsied_eval_theplain");
  
INSERT INTO `content__study_evaluation_schemes` VALUES
  ("forsied_eval_lakeland", "de.unibonn.creedo.studies.designs.EvaluationScheme"),
  ("forsied_eval_theplain", "de.unibonn.creedo.studies.designs.EvaluationScheme");
INSERT INTO `content__study_evaluation_schemes_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("forsied_eval_lakeland", "Name", "Evaluation scheme for trial based on dataset Lakeland"),
  ("forsied_eval_lakeland", "Description",  "The evaluators rate the results generated by participants based on their cumulative knowledge gain about Lakeland."),
  ("forsied_eval_lakeland", "Instructions", "[study_lakeland_eval_inst.html]"),
  ("forsied_eval_lakeland", "Rating Metrics", "[CUMULATIVE_KNOWLEDGE]"), 
  
  ("forsied_eval_theplain", "Name", "Evaluation scheme for trial based on dataset The Plain."),
  ("forsied_eval_theplain", "Description",  "The evaluators rate the results generated by participants based on their cumulative knowledge gain about The Plain."),
  ("forsied_eval_theplain", "Instructions", "[study_theplain_eval_inst.html]"),
  ("forsied_eval_theplain", "Rating Metrics", "[CUMULATIVE_KNOWLEDGE]");

