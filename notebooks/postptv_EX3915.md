---
jupyter:
  jupytext:
    formats: ipynb,py,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.2'
      jupytext_version: 1.4.1
  kernelspec:
    display_name: Python [conda env:flowtracks]
    language: python
    name: conda-env-flowtracks-py
---

```python jupyter={"outputs_hidden": false}
import numpy as np
import matplotlib.pyplot as plt
from flowtracks.io import iter_trajectories_ptvis
%matplotlib inline
```

```python jupyter={"outputs_hidden": false}
# see openptv forum for Christophe Henry messages
inName = "../res/ptv_is.%d" 
# or use the test data
# inName = "./test_data/ptv_is.%d" # the directory with the input files
```

```python jupyter={"outputs_hidden": false}
#----parameters
traj_min_len = 5 # in this particular example we have short trajectories

#----cal traj.
trajects = list(iter_trajectories_ptvis(inName, first=10000, last=10100, traj_min_len=traj_min_len,frate=20))
```

```python
print(f"{len(trajects)} trajectories")
```

```python
from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure(figsize=(12,10))
ax = fig.add_subplot(111, projection='3d')
for tr in trajects: # generate one trajectory per loop call
    plt.plot(tr.pos()[:,0],tr.pos()[:,1],tr.pos()[:,2], '-o')
```

```python
# velocity histograms

u,v,w = [],[],[]
ax,ay,az = [],[],[]

for tr in trajects:
    u.append(tr.velocity()[:,0])
    v.append(tr.velocity()[:,1])
    w.append(tr.velocity()[:,2])
    
    ax.append(tr.accel()[:,0])
    ay.append(tr.accel()[:,1])
    az.append(tr.accel()[:,2])
```

```python
fig,a = plt.subplots(1,2,figsize=(10,8))

a[0].hist(np.hstack(u),100,alpha=0.1);
a[0].hist(np.hstack(v),100,alpha=0.1);
a[0].hist(np.hstack(w),100,alpha=0.1);

a[1].hist(np.hstack(ax),100,alpha=0.1);
a[1].hist(np.hstack(ay),100,alpha=0.1);
a[1].hist(np.hstack(az),100,alpha=0.1);
a[0].set_xlim(-0.005,0.005)
a[1].set_xlim(-0.001,0.001)
```

```python
tr.pos()
```

```python
tr.velocity()
```

```python

```
