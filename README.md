# PIORACLE

[Python gnupg (GPG) example](https://www.saltycrane.com/blog/2011/10/python-gnupg-gpg-example/)

[PYTHON-GNUPG И PYTHON 3](https://www.8host.com/blog/proverka-koda-i-shifrovanie-dannyx-s-pomoshhyu-python-gnupg-i-python-3/)

### Run Project
```shell script
python3 index.py -[commands]
```

### List packages python
```shell script
pip freeze > requirements.txt
```

### Delete packages python
```shell script
pip freeze | xargs pip uninstall -y
```
or
```shell script
pip freeze | grep -v "^-e" | xargs pip uninstall -y
```
