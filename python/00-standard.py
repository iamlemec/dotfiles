from mectools.hyper import *
import pandas as pd
import numpy as np

# patching numpy
np.concat = np.concatenate

# patcher loader for matplotlib
def plotter(pyplot=True, theme=['clean'], rc={}):
    import matplotlib as mpl
    import seaborn as sns
    import pandas as pd

    mpl.style.use(theme)
    mpl.rcParams.update(rc)
    mpl.interactive(True)

    # auto despiner
    def despiner(f):
        def fp(*args, **kwargs):
            dsp = kwargs.pop('despine', True)
            ret = f(*args, **kwargs)
            if dsp:
                sns.despine()
            return ret
        return fp

    for n in ['plot', 'scatter', 'bar']:
        setattr(mpl.axes.Axes, n, despiner(getattr(mpl.axes.Axes, n)))

    # kill hist grid
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
