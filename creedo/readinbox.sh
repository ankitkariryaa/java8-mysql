name=test
echo "cp inbox/data_"$name".csv persistent_data/content" | xargs
echo "cp inbox/data_"$name"_attributes.csv persistent_data/content" | xargs
echo "\"DELETE FROM  mining__data_parameters where entry_id ='"$name"'; DELETE FROM  mining__data where id ='"$name"';\"" | xargs mysql -D creedo_0.3.1 -e 
echo "\"INSERT INTO mining__data (id,content_class_name) VALUES ('"$name"','de.unibonn.creedo.boot.FixedComponentWorkspaceBuilder');\"" | xargs mysql -D creedo_0.3.1 -e  
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Table name','"$name"');\"" | xargs mysql -D creedo_0.3.1 -e
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Table description','');\"" | xargs mysql -D creedo_0.3.1 -e
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Data file','data_"$name".csv');\"" | xargs mysql -D creedo_0.3.1 -e
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Attributes file','data_"$name"_attributes.csv');\"" | xargs mysql -D creedo_0.3.1 -e
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Delimeter',',');\"" | xargs mysql -D creedo_0.3.1 -e
echo "\"INSERT INTO mining__data_parameters (entry_id,param_name,param_value) VALUES ('"$name"','Missing code','?');\"" | xargs mysql  -D creedo_0.3.1 -e

