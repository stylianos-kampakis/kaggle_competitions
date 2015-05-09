import pandas as pd
from sklearn.linear_model import *
from sklearn.ensemble import *
from sklearn.cross_validation import cross_val_score, cross_val_predict
import pandas.core.reshape as reshape

df=pd.read_csv("C:\\train.csv")
df.drop(df.columns[0],axis=1,inplace=True)
df.drop('City',axis=1,inplace=True)
df.drop('Type',axis=1,inplace=True)
h=df.loc[:,'Open Date']
h=pd.to_datetime(h)
h=h.apply((lambda x: x.year))
df.loc[:,'Open Date']=h

g=reshape.get_dummies(df.loc[:,'City Group'])
df.drop('City Group',axis=1,inplace=True)
df=pd.concat([g,df],axis=1)


labels = df["revenue"].values
features = df[df.columns[0:(len(df.columns)-2)]].values

et=ExtraTreesRegressor(n_estimators=200)

predicted = cross_val_predict(et, features, labels, n_jobs=4, cv=10)
 
fig,ax = plt.subplots()
ax.scatter(df.loc[:,'revenue'], predicted)
#ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
ax.set_xlabel('Measured')
ax.set_ylabel('Predicted')
fig.show() 
 
print(sklearn.metrics.mean_squared_error(df.loc[:,'revenue'], predicted))