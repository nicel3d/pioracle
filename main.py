import cx_Oracle
import config

connection = None
try:
    dsnStr = cx_Oracle.makedsn(config.host, config.port, config.dsn)
    connection = cx_Oracle.connect(config.username, config.password, dsnStr, cx_Oracle.SYSDBA)
    print(connection.version)
except cx_Oracle.Error as error:
    print(error)

if __name__ == '__main__':
    # file_object = open("./sqls/2.1.numeric.sql", "r")
    # file_object.close()
    c = connection.cursor()
    rows = c.execute("select fid from t1 where REGEXP_LIKE(FID, '^[0-9]+$')").fetchall()
    filtered_numbers = filter(lambda n: len(repr(n)) == len(set(repr(n))), [int(row[0]) for row in rows])
    print(list(filtered_numbers))
    connection.close()
