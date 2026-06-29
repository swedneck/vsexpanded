#!/bin/sh


if [ ! -d "build" ]; then
  mkdir build
fi

cd modpack

version=$(cat modinfo.json | python -c "import json,sys; obj=json.load(sys.stdin); print(obj['version']);")

zip -r "../build/vsexpanded-${version}.zip" ./*
