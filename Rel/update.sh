DB=Anand.DB
rel_dir="Rel"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

old_ver=`cat version`
echo "Old Version:          $old_ver"

cd ..

cur_ver=`ls -ltr | grep ins_ | wc -l`
echo "Current Version: $cur_ver"
echo

if [ $old_ver -eq $cur_ver ]; then
  echo "Already Up to date"
  
else
  echo "Updating current trades"
  psql -d $DB < upd_trds.sql
  echo
  
  cp $rel_dir/version $rel_dir/version.old
  
  inc_ver=`cat upd_trds.sql | grep ins_ | wc -l`
  let new_ver="$old_ver + $inc_ver"
  echo $new_ver > $rel_dir/version

  echo "Updated to Version: $new_ver"

fi