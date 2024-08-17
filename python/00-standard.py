# mectools (off for now)
# from mectools.hyper import *
# from mectools.plotter import *

from pathlib import Path
import pandas as pd
import numpy as np

# numpy precision
np.set_printoptions(precision=4, suppress=True, linewidth=120)

# build it in
from itertools import chain

# patching numpy
np.concat = np.concatenate

# pandas indexing
idx = pd.IndexSlice

# dataframe paging
from IPython.core.magic import register_line_magic
from IPython.core.page import page
@register_line_magic
def paged(s):
    page(s)

