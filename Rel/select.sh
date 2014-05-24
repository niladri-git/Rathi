DB=Anand.DB
rel_dir="Rel"

if [ $1 ]; then
  DB=$1
else
  echo "DB not specified. Setting as $DB"  
  echo
fi

cd ..

psql -d $DB < sel_trds.sql
