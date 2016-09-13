echo "Gebe Datum an( 2016-06-20 12:00 ):"
read date
echo "Eingegebenes Datum $date"

#set -x
#echo "git submodule foreach --recursive git checkout `git rev-list -n 1 --before="$date" master`"
git submodule foreach --recursive sh -c "git checkout \`git rev-list -n 1 --before=\"$date\" master\`"
#echo "git checkout `git rev-list -n 1 --before="$date" master`"
git checkout `git rev-list -n 1 --before="$date" master`