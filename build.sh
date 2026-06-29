#!/bin/sh


#only create build folder if it doesn't already exist
if [ ! -d "build" ]; then
  mkdir build
fi

# only continue if valid, otherwise error
if python -mjson.tool "modpack/modinfo.json" > /dev/null 2> /dev/null; then

  version=$(cat modpack/modinfo.json | python -c "import json,sys; obj=json.load(sys.stdin); print(obj['version']);")
  #horrid hack to avoid a wrapping folder inside the zip
  cd modpack
  zip -q -r "../build/vsexpanded-${version}.zip" ./*
  cd ..
  echo "Built ${version} successfully"
  exit 0

else

  validation=$(python -mjson.tool "modpack/modinfo.json" 2>&1)
  date=$(date '+%Y-%m-%dT%H:%M:%S')
  errorfile="build/error_${date}.log"
  echo "ERROR: Failed to validate modinfo.json" | tee -a $errorfile
  printf "\n" >> $errorfile
  echo $validation | tee -a $errorfile
  exit 1

fi
