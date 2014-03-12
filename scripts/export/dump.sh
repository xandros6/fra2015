export CATALINA_BASE=/usr/local/tomcat_instances/fra2015

TEMP_DIR=/tmp
COOKIES=$TEMP_DIR/fra-export.dat

ISO3FILE=$CATALINA_BASE/fra/countries.iso3

OUTDIR=/var/www/html/download/dump/xml
XMLDIR=$OUTDIR/files

SERVER=http://foreststats.org/fra2015

DATE=$(date +"%Y%m%d_%H%M")

## Default credentials. Update with your ones.
LOGINUSER=admin
LOGINPW=frafra

echo "$DATE Logging in..."

curl "$SERVER/j_spring_security_check"  -H 'Content-Type: application/x-www-form-urlencoded' --data 'j_username=${LOGINUSER}&j_password=${LOGINPW}' -c "$COOKIES"

for iso3 in $(cat $ISO3FILE) ; do
  echo Exporting $iso3
  curl -b $COOKIES $SERVER/export/${iso3} > $XMLDIR/${iso3}.xml
done

TMPFILE=$OUTDIR/${DATE}_temp_.___
tar czvf $TMPFILE $XMLDIR/*.xml
mv $TMPFILE $OUTDIR/${DATE}_FRASurveys.tgz

