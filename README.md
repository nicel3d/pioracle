# PIORACLE

[Python gnupg (GPG) example](https://www.saltycrane.com/blog/2011/10/python-gnupg-gpg-example/)

[PYTHON-GNUPG И PYTHON 3](https://www.8host.com/blog/proverka-koda-i-shifrovanie-dannyx-s-pomoshhyu-python-gnupg-i-python-3/)

### Подклучение oracle использловался через docker - образ
```markdown
https://hub.docker.com/u/nikel3d/content/sub-9b77c632-3a15-4805-9dc2-f62bb8fcb195
```

#### Исправление отсутсвующего файла "libaio"
Читать раздел "Oracle Instant Client Zip Files"
```markdown
https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
```

### Description
Файл *1.generate.sql* - генерирует и встаивает стоки в таблицу "T1" с полем "FID"
Условия генерирования:
1. 10% записей в таблице содержат только цифровые символы – [0-9]
2. 85% записей в таблице содержат любые символы
3. 5% записей в таблице - пустые
4. Длина ( размер ) непустых записей может составлять от 1 до 2000.
5. В таблице присутствует как минимум одна запись каждого из размеров  - [1..2000].
6. Общее число записей в таблице 100 000 строк.

Файл *2.1.numeric.sql*
Возвращающих количество записей таблицы T1, содержащих только цифровые символы. (regex)

Файл *2.2.numeric.sql*
Возвращающих количество записей таблицы T1, содержащих только цифровые символы. (create function)

Файл *main.py* отображает результат: возвращающего количество записей таблицы T1, содержащих только цифровые символы,
 которые содержат только уникальные цифры, каждая цифра из множества [0-9] обязательно присутствует.

### Исправление отсутсвующих записей в main.py
Если данные имеются в oracle *SYS.T1* а данные не выводятся нужно, принудительно обновить схему Oracle
```sql
begin
   dbms_stats.gather_schema_stats('sys');
end;
```

or

```sql
alter system flush shared_pool;
alter system flush buffer_cache;
```

or

```sql
alter session set events 'immediate trace name flush_cache';
```

### Run Project
Отображает подключение Oracle из 
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
