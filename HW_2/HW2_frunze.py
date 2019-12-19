#!/usr/bin/env python
# coding: utf-8

# In[3]:


import psycopg2
import getpass

conn=psycopg2.connect(user='postgres',
              database='postgres',
              host='localhost',
              port='5432',
              password=getpass.getpass('Insert password: '))


# In[4]:


print(conn.get_dsn_parameters())


# In[6]:


import pandas as pd
cursor = conn.cursor()
cursor.execute('SELECT * FROM public.listing_task LIMIT 10')
for row in cursor:
    print(row)    


# In[7]:


df = pd.read_sql("SELECT * FROM public.listing_task", conn)
df.head(10)


# In[9]:


df = pd.read_sql("SELECT * FROM public.bond_description", conn)
df.head(10)


# In[ ]:





# In[ ]:




