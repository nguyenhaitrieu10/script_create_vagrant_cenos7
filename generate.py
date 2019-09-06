import sys
import os
from datetime import datetime

def main():
    arg = sys.argv
    if len(arg) != 2:
        print('Need one param: IP of VM')
        return
    
    ip = arg[1]
    if not os.path.isfile('Vagrantfile'):
        os.system('vagrant init centos/7')
    fin = open("Vagrantfile", "rt")
    data = fin.read()
    data = data.replace('# config.vm.network "private_network", ip: "192.168.33.10"', 'config.vm.network "private_network", ip: "%s"' %ip)
    fin.close()

    new_vm = "vm__(%s)__%s" %(str(datetime.now()).replace(' ', '_'), ip)
    os.mkdir(new_vm)
    fout = open(new_vm + '/Vagrantfile', 'wt')
    fout.write(data)
    fout.close()


if __name__ == '__main__':
    main()

