#!/bin/bash
pushd . > /dev/null
sDir=`dirname $0`
cd ${sDir}
sDir=`pwd -P`
popd > /dev/null

if [ -z $JANUSGRAPH_HOME ]
then
	JANUSGRAPH_HOME=$sDir
else
	echo "JanusGraph lib path is set to $JANUSGRAPH_HOME"
fi

usage(){
cat <<EOF
Usage: $0 [options]
options:
	gencsv	Generate CSV, schema, datamapper
	import	Import CSV to Janusgraph
EOF
}
CP="${sDir}/lib/commons-csv-1.4.jar:${sDir}/conf:${JANUSGRAPH_HOME}/lib/*"
class=$1
case $class in
    gencsv)
    shift
		java -cp $CP:${sDir}/target/JanusGraphBench-0.0.1-SNAPSHOT.jar com.ibm.janusgraph.utils.generator.JanusGraphBench $@
		;;
    import)
    shift
		java -cp $CP:${sDir}/target/JanusGraphBench-0.0.1-SNAPSHOT.jar com.ibm.janusgraph.utils.importer.BatchImport $@
    ;;
    *)
    usage      # unknown option
    ;;
esac
#java -cp $CP:target/JanusGraphBench-0.0.1-SNAPSHOT.jar com.ibm.janusgraph.utils.importer.BatchImport $@
#java -cp $CP:target/JanusGraphBench-0.0.1-SNAPSHOT.jar com.ibm.janusgraph.utils.generator.JanusGraphBench $@

