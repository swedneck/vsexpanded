#!/usr/bin/env python3

import json

with open("modpack/modinfo.json") as modinfo_file:
    modinfo = json.load(modinfo_file)
    modlist = [item for item in modinfo["dependencies"]]
    for item in modlist:
        print(item)
