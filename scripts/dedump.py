"""
Find INDI server data dumps in flatlogs

Usage:

  ### Trigger dump to flatlogs:
  echo dump >> /opt/MagAOX/drivers/fifos/indiserver.ctrl

  ### Parse any dumps in flatlogs:
  python dedump.py isMagAOX01

"""
import os
import sys
import json
import pprint
import subprocess

def go(isName):

  ### Strem logger data to a pipe; initialize state
  p = subprocess.Popen(f'logdump {isName}'.split(),stdout=subprocess.PIPE)
  state = 'lookfordump'

  ### Loop over input lines from logdump subprocess output
  for bline in p.stdout:

    ### Convert to string; strip trailing data; get timestamp and data
    line = bline.decode('8859').strip()
    if line.endswith('\x1b[0m'): line = line[:-4]
    logtime,logdata = line[:39], line[39:]

    ### Initial state:  look for dump notification
    if 'lookfordump' == state:
      if 'FIFO: dump' == logdata: state = 'firstlineofdump'

    ### Second state:  get timestamp and data from first line of dump
    elif 'firstlineofdump' == state:
      dumptime,jstring = logtime,logdata
      state = 'subsequentlineofdump'

    ### Third state:  get more data from lines with same timestamp
    elif 'subsequentlineofdump' == state:
      if dumptime == logtime:
        jstring += logdata
      else:
        ### If timestamp changed, reset state to look for next dump ...
        state = 'lookfordump'
        ### ... and output parsed JSON data
        j = json.loads(jstring)
        if type(j) is list: j.append(dict(dumptime=dumptime))
        elif type(j) is dict: j.update(dict(dumptime=dumptime))
        pprint.pprint(j)

########################################################################
if "__main__" == __name__ and sys.argv[1:]:
  go(sys.argv[1])
