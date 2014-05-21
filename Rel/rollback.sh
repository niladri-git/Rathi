DB=Anand.DB
rel_dir="Rel"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

cur_ver=`cat version`
echo "Current Version:          $cur_ver"

prev_ver=`cat version.old`
echo "Rollback Version:         $prev_ver"
echo

cd ..

if [ $prev_ver -ge $cur_ver ]; then
  echo "Unable to rollback"
  
else
  echo "Rolling back current trades"
  psql -d $DB < rol_new_trds.sql

  cp $rel_dir/version.old $rel_dir/version
  echo "Rolled back to Version: $prev_ver"

fi