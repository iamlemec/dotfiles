from mectools.hyper import *
from mectools.plotter import *
import pandas as pd
import numpy as np

# patching numpy
np.concat = np.concatenate

# theme up altair
altair_config()
import pdvega
