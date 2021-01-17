from mectools.hyper import *
from mectools.plotter import *
import pandas as pd
import numpy as np

# build it in
from itertools import chain

# patching numpy
np.concat = np.concatenate

# pandas indexing
idx = pd.IndexSlice

# theme up altair
altair_config()
import pdvega
