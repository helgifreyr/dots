import os,sys
f1=os.popen('/home/helgi/Wolfram/Mathematica/8.0/Executables/math ', 'w')
f1.flush()
while 1:
  sys.stdout.write('')
  try:
    line=raw_input()
    f1.writelines(line+'\n')
    f1.flush()
  except KeyboardInterrupt:
    f1.close()
    break
sys.stdout.write('\n')
sys.exit()
