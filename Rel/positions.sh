DB=Anand.DB

cd ..

echo "Calculating Positions..."
echo

psql -d $DB < net_pos.sql