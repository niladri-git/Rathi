DB=Anand.DB
rel_dir="Rel"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

ins_ver=`cat version | grep Version: | cut -d" " -f2`
echo "Installed Version:          $ins_ver"

cd ..

upd_ver=`ls -ltr | grep ins_ | wc -l`
echo "Update Version:        $upd_ver"
echo

if [ $ins_ver -eq $upd_ver ]; then
  echo "Already Up to date"
  
else
  echo "Updating current trades"
  psql -d $DB < upd_trds.sql
  echo
  
  cp $rel_dir/version $rel_dir/version.old
  
  inc_ver=`cat upd_trds.sql | grep ins_ | wc -l`
  let new_ver="$ins_ver + $inc_ver"
  
  echo > $rel_dir/version
  echo Version: $new_ver >> $rel_dir/version
  
  date=`date +%d-%m-%Y`
  
  echo "Installation date: $date" >> $rel_dir/version
  echo >> $rel_dir/version

  echo "Updated to Version: $new_ver"

fi