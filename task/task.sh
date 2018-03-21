#!/bin/bash

VALIDATOR=$1
COUNTRY=$2
AWS_BUCKET=$3

curl https://s3.amazonaws.com/mapbox/osm-qa-tiles-production/latest.country/$COUNTRY.mbtiles.gz > $COUNTRY.mbtiles.gz
gunzip $COUNTRY.mbtiles.gz
npx osmlint $VALIDATOR --zoom 12 $COUNTRY.mbtiles > output.json
aws s3 cp output.json s3://$3/${VALIDATOR}-${COUNTRY}-$(date +%s).json
