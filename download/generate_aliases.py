#!/usr/bin/env python2

from __future__ import print_function

import json
import os
import sys

if len(sys.argv) != 2:
    print('usage: ' + sys.argv[0] + ' /path/to/peers')
    sys.exit(1)

peersDir = sys.argv[1]

def normalizeMac(mac):
    mac = mac.lower()
    normalized = ''

    n = 0

    for c in mac:
        if c != ':':
            if n > 0 and n % 2 == 0:
                normalized = normalized + ':'
            normalized = normalized + c
            n += 1

    return normalized

def toAlias(peer):
    alias = {}

    if not (peer.has_key('name') and peer.has_key('mac')):
        return None

    name = peer['name']
    mac = peer['mac']

    alias['node_id'] = mac.replace(':', '')
    alias['hostname'] = name

    if peer.has_key('geo'):
        geo = peer['geo']

        location = {}

        if geo.has_key('lon'): location['longitude'] = geo['lon']
        if geo.has_key('lat'): location['latitude'] = geo['lat']

        alias['location'] = location

    #alias['network'] = {}
    #alias['network']['mesh_interfaces'] = [mac]

    return alias

aliases = []

for filename in os.listdir(peersDir):
    if len(filename) == 0 or filename[0] == '.':
        continue

    isGateway = False

    absFilename = peersDir + '/' + filename
    if os.path.isfile(absFilename):
        peerFile = open(absFilename, 'r')
        try:
            peerLines = peerFile.readlines()
            peer = {}

            for line in peerLines:
                parts = line.split()

                if len(parts) > 2:
                    if parts[1] == 'Knotenname:':
                        peer['name'] = parts[2]

                    elif parts[0] == 'remote':
                        isGateway = True

                    elif parts[1] == 'MAC:':
                        peer['mac'] = normalizeMac(parts[2])

                    elif parts[1] == 'Koordinaten:' and len(parts) > 3:
                        try:
                            peer['geo'] = {'lat': float(parts[2]), 'lon': float(parts[3])}

                        except ValueError:
                            print('Error in %s: Invalid coordinates: %s' % (absFilename, parts[2:4]), file = sys.stderr)

                elif len(parts) == 2 and parts[0] == 'key':
                    keyParts = parts[1].split('"')
                    if len(keyParts) > 1:
                        peer['vpn'] = keyParts[1].lower()

            if isGateway:
                continue

            alias = toAlias(peer)
            if alias:
                aliases.append(alias)

        except Exception as e:
            print('Error in %s, ignoring peer: %s' % (absFilename, e), file = sys.stderr)

        finally:
            peerFile.close()

print(json.dumps(aliases))
