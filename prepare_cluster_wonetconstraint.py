# #!/usr/bin/python3
# from mergexp import unit
# from mergexp.unit import mbps,ms
# from mergexp.net import capacity,latency

# net = mergexp.Topology('testapac')

# n0=net.device('n0')
# n1=net.device('n1')
# n2=net.device('n2')
# n3=net.device('n3')
# n4=net.device('n4')
# n5=net.device('n5')

# #Links
# net.connect([n0,n1])
# net.connect([n0,n2])
# net.connect([n0,n3])
# net.connect([n0,n4])
# net.connect([n0,n5])
# net.connect([n1,n2])
# net.connect([n1,n3])
# net.connect([n1,n4])
# net.connect([n1,n5])
# net.connect([n2,n3])
# net.connect([n2,n4])
# net.connect([n2,n5])
# net.connect([n3,n4])
# net.connect([n3,n5])
# net.connect([n4,n5])

# mergexp.experiment(net)

import mergexp

net = mergexp.Topology('testapac')

n0=net.device('n0')
n1=net.device('n1')
n2=net.device('n2')
n3=net.device('n3')
n4=net.device('n4')
n5=net.device('n5')

#Links
net.connect([n0,n1,n2,n3,n4,n5])

mergexp.experiment(net)