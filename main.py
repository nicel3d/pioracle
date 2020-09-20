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
    c = connection.cursor()
    c.execute('select fid from SYS.T1')
    for row in c:
        print(row[0])
    connection.close()
