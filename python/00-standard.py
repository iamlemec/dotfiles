from mectools.hyper import *
import pandas as pd
import numpy as np

# patching numpy
np.concat = np.concatenate

# patcher loader for matplotlib
def plotter(pyplot=True, backend='GTK3Agg', theme=['clean'], rc={}):
    import matplotlib as mpl
    import matplotlib.style as style

    mpl.use(backend)
    style.use(theme)
    mpl.rcParams.update(rc)
    mpl.interactive(True)

    # kill hist grid
    import pandas as pd
    if not hasattr(pd.Series, 'hist0'):
        pd.Series.hist0 = pd.Series.hist
        def hist(*args, **kwargs):
            if 'grid' not in kwargs:
                kwargs['grid'] = False
            pd.Series.hist0(*args, **kwargs)
        setattr(pd.Series, 'hist', hist)

    if pyplot:
        import matplotlib.pyplot as plt
        return plt
