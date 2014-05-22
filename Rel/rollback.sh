DB=Anand.DB
rel_dir="Rel"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

ins_ver=`grep Version: version | cut -d" " -f2`
echo "Installed Version:          $ins_ver"

rol_ver=`grep Version: version.old | cut -d" " -f2`
echo "Rollback Version:           $rol_ver"
echo

cd ..

if [ $ins_ver -le $rol_ver ]; then
  echo "Rollback version is not less than Installed Version"
  
else
  echo "Rolling back current trades"
  psql -d $DB < rol_new_trds.sql

  cp $rel_dir/version.old $rel_dir/version
  echo "Rolled back to Version: $rol_ver"

fi