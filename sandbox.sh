PSQL="psql --username=chase --dbname=test -t --no-align -c"

MYQUERY=$($PSQL "SELECT * FROM test")

echo $MYQUERY