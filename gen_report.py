# -*- coding: utf-8 -*-
"""
Created on Tue Jun 27 10:28:26 2023

@author: Kaushal Baghel
"""

import numpy as np
import pandas as pd
import os
from ydata_profiling import ProfileReport

for i in os.listdir(os.getcwd()):
	if i.endswith("index.html"):
		os.remove("index.html")	
	if i.endswith(".csv"):
		path="./"+i
		print(path)
    break
df = pd.read_csv(path)
profile = ProfileReport(df, title="Profiling Report")
profile.to_file("index.html")
print(os.getcwd())
