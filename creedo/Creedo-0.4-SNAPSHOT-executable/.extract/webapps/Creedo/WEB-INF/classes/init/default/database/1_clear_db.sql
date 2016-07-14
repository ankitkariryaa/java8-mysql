# activate the following option when having problems with to large transactions
# note that db user needs super privilege to run this script

# SET GLOBAL max_allowed_packet=110857600; 

# max_allowed_packet:  a packet is a single SQL statement sent to the MySQL server or a single row that is sent to the client, largest possible packet: 1GB. 
# When the MySQL server receives a packet bigger than max_allowed_packet, error 2006 occurs ("mysql server has gone away error 2006").  
# If a new table is added and the database reinitialization fails due to error 2006, increase the max_allowed_packet variable. 
# See: http://dev.mysql.com/doc/refman/5.1/en/packet-too-large.html; 
