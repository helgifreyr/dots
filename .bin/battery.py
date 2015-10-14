from subprocess import check_output
import re

info = check_output(['acpi','-b'])
info1 = info.split('\n')[0]
info2 = info.split('\n')[1]
info1 = info1.split(',')
info2 = info2.split(',')


# battery_level = re.sub('\D', '', info[1])
battery_level1 = int(''.join(i for i in info1[1] if i.isdigit()))
battery_level2 = int(''.join(i for i in info2[1] if i.isdigit()))

if battery_level1 > 50:
  battery_one = '<fc=#25143e>'+str(battery_level1)+'%</fc>'
elif battery_level1 <= 50 and battery_level1 > 20:
  battery_one = '<fc=#5f349d>'+str(battery_level1)+'%</fc>'
else:
  battery_one = '<fc=#c11b17>'+str(battery_level1)+'%</fc>'
if battery_level2 > 50:
  battery_two = '<fc=#25143e>'+str(battery_level2)+'%</fc>'
elif battery_level2 <= 50 and battery_level2 > 20:
  battery_two = '<fc=#5f349d>'+str(battery_level2)+'%</fc>'
else:
  battery_two = '<fc=#c11b17>'+str(battery_level2)+'%</fc>'

print 'B: '+battery_one +'<fc=#8B7B8B>/</fc>'+ battery_two
