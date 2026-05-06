#!/bin/sh

mkdir build
cd modpack
zip -r "../build/vsexpanded-${1}.zip" ./*
