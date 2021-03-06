INSERT INTO `content__study_designs` VALUES
  ("cjs_1x2_design", "de.unibonn.creedo.studies.designs.StudyDesignBuilder");
INSERT INTO `content__study_designs_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_1x2_design", "Name", "CJS 1x2 design"),
  ("cjs_1x2_design", "Description",  "This design compares subgroup discovery with the cjs deviation measure fixed to subgroup discovery where the deviation measure (and target model class) can be freely chosen."),
  ("cjs_1x2_design", "System Specifications", "[cjs_study_target_system, cjs_study_control_system]"),
  ("cjs_1x2_design", "Task Specifications", "[cjs_study_task]"),
  ("cjs_1x2_design", "Assignment Scheme", "TWO_PHASE_ASSIGNMENT"),
  ("cjs_1x2_design", "Results per evaluator", "3");
  
INSERT INTO `content__studies` VALUES
  ("cjs_demo_study", "de.unibonn.creedo.studies.StudyBuilder");
INSERT INTO `content__studies_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_demo_study", "Name", "Bike rental usage analysis"),
  ("cjs_demo_study", "Description", "<p>Understand the usage data of a bike rental service.</p> <p>This study demostrates an alternative usage of Creedo for system evaluation.</p>"),
  ("cjs_demo_study", "ImgUrl", "demo_bike.jpg"),
  ("cjs_demo_study", "ImgCredits", ""),
  ("cjs_demo_study", "Design", "cjs_1x2_design"),
  ("cjs_demo_study", "State", "SETUP"),
  ("cjs_demo_study", "Participants", "[bob@realkd.org,berta@realkd.org,joe@realkd.org,jane@realkd.org]"),
  ("cjs_demo_study", "Evaluators", "[bob@realkd.org,berta@realkd.org,joe@realkd.org,jane@realkd.org]");
  
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('cjs_study_target_system','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems` (`id`,`content_class_name`) VALUES ('cjs_study_control_system','de.unibonn.creedo.webapp.dashboard.mining.ManualMiningSystemBuilder');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_study_target_system','Algorithms','[CJS_TARGET_STUDY_SAMPLER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_study_target_system','Post processor','Default ranker');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_study_control_system','Algorithms','[CJS_CONTROL_STUDY_SAMPLER]');
INSERT INTO `mining__mining_systems_parameters` (`entry_id`,`param_name`,`param_value`) VALUES ('cjs_study_control_system','Post processor','Default ranker');
  
INSERT INTO `content__study_system_specifications` VALUES 
  ("cjs_study_target_system", "de.unibonn.creedo.studies.designs.SystemSpecBuilder"),
  ("cjs_study_control_system", "de.unibonn.creedo.studies.designs.SystemSpecBuilder");
INSERT INTO `content__study_system_specifications_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_study_target_system", "Name", "CJS Target System"),
  ("cjs_study_target_system", "Description", "System with algorithms where cjs is fixed."),
  ("cjs_study_target_system", "Analytics Dashboard Builder", "cjs_study_target_system"), 
  ("cjs_study_control_system", "Name", "CJS Control System"),
  ("cjs_study_control_system", "Description", "System with algorithms that offer deviation measure options except cjs."),
  ("cjs_study_control_system", "Analytics Dashboard Builder", "cjs_study_control_system"); 
  
INSERT INTO `content__study_task_specifications` VALUES
  ("cjs_study_task", "de.unibonn.creedo.studies.designs.TaskSpecBuilder");  
INSERT INTO `content__study_task_specifications_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_study_task", "Name", "First task of FORSIED study."),
  ("cjs_study_task", "Description",  "Participants try to find informative set of 3 patterns about Lakeland."),
  ("cjs_study_task", "Instructions", "[study_cjs_trial_inst.html]"),
  ("cjs_study_task", "Result definition", "Single patterns are results"),
  ("cjs_study_task", "Max. number of results", "3"),
  ("cjs_study_task", "Min. number of results", "3"),
  ("cjs_study_task", "Input", "bike"),
  ("cjs_study_task", "Evaluation Scheme", "cjs_study_eval");
  
INSERT INTO `content__study_evaluation_schemes` VALUES
  ("cjs_study_eval", "de.unibonn.creedo.studies.designs.EvaluationScheme");
INSERT INTO `content__study_evaluation_schemes_parameters` (`entry_id`, `param_name`, `param_value`) VALUES
  ("cjs_study_eval", "Name", "Evaluation scheme for cjs study."),
  ("cjs_study_eval", "Description",  "The evaluators rate the results generated by participants based on validity and interestingness."),
  ("cjs_study_eval", "Instructions", "[study_cjs_eval_inst.html]"),
  ("cjs_study_eval", "Rating Metrics", "[VALIDITY, INTERESTINGNESS]");

