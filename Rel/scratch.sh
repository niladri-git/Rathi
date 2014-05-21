DB=Anand.DB
rel_dir="Rel"

echo "Creating from scratch"
echo

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

cd ..

echo "Deleting DB"
dropdb  $DB

echo "Creating DB"
createdb $DB

echo "Inserting init trades"
psql -d $DB < init_run.sql

echo "Inserting new trades"
psql -d $DB < ins_new_trds.sql

echo "Updating current trades"
psql -d $DB < upd_trds.sql

echo "Calculating Net Position"
psql -d $DB < net_pos.sql

cp $rel_dir/version $rel_dir/version.old

cur_ver=`ls -ltr | grep ins_ | wc -l`
echo $cur_ver > $rel_dir/version

echo "Current Version: $cur_ver"