# jupyter config
```sh 
pip install jupyter
jupyter notebook --generate-config
``` 

### ipython
```sh
from notebook.auth import passwd
passwd()
```
## or
```sh
jupyter notebook password
```

```sh 
vim ~/.jupyter/jupyter_notebook_config.py 
```

```python
c.NotebookApp.ip='*'
c.NotebookApp.password = u''
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8000
```

```sh
jupyter notebook
```
