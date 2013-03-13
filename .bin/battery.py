from subprocess import check_output
import re

info = check_output(['acpi','-b'])
info = info.split(',')

# battery_level = re.sub('\D', '', info[1])
battery_level = ''.join(i for i in info[1] if i.isdigit())

if battery_level > 50:
  print 'B: <fc=#25143e>'+str(battery_level)+'%</fc>'
elif battery_level <= 50 and battery_level > 20:
  print 'B: <fc=#5f349d>'+str(battery_level)+'%</fc>'
else:
  print 'B: <fc=#c11b17>'+str(battery_level)+'%</fc>'
