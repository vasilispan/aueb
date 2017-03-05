register hdfs://master:54310/data/myudfs.jar

raw = LOAD 'hdfs://master:54310/data/hw2-rdf-2016_data/*' USING TextLoader as (line:chararray);

ntriples = foreach raw generate FLATTEN(myudfs.RDFSplit3(line)) as (subject:chararray,predicate:chararray,object:chararray);

subjects = GROUP ntriples BY subject;

count_edges = FOREACH subjects GENERATE group as subject_name, COUNT(ntriples) as out_degree;

out_degree_value = GROUP count_edges BY out_degree;

results = FOREACH out_degree_value GENERATE group, COUNT(count_edges);

store results into 'pig_output' using PigStorage();
