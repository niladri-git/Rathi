echo "Creating from scratch"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting it to Anand.DB"
  DB=Anand.DB
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