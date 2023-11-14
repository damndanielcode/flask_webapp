import os

# Grabs the folder where the script runs.
basedir = os.path.abspath(os.path.dirname(__file__))

SECRET_KEY=os.urandom(32)
deployment_location='microsoft'

SQLALCHEMY_TRACK_MODIFICATIONS=False

DEPLOYMENT_LOCATION=deployment_location

# db_name = os.environ.get('DB_NAME')
# db_user_name = os.environ.get('DB_USER_NAME')
# db_password = os.environ.get('DB_PASSWORD')
# db_connector = os.environ.get('DB_CONNECTOR')
# db_port = os.environ.get('DB_PORT')


# if deployment_location == "local":
#    db_host = os.environ.get('DB_HOST')
#    database_path = "{}://{}:{}@{}:{}/{}".format(db_connector, db_user_name, db_password, db_host, db_port, db_name)

# elif deployment_location == "gcp":
#     unix_socket_path = os.environ.get('INSTANCE_UNIX_SOCKET')
#     database_path = "{}://{}:{}@/{}?unix_sock={}/.s.PGSQL.{}".format(db_connector, db_user_name, db_password, db_name, unix_socket_path, db_port)

# elif deployment_location == "microsoft":
conn_str = os.environ.get('AZURE_POSTGRESQL_CONNECTIONSTRING')
conn_str_params = {pair.split('=')[0]: pair.split('=')[1] for pair in conn_str.split(' ')}
database_path = 'postgresql://{dbuser}:{dbpass}@{dbhost}/{dbname}'.format(
    dbuser=conn_str_params['user'],
    dbpass=conn_str_params['password'],
    dbhost=conn_str_params['host'],
    dbname=conn_str_params['dbname']
)

# else:
#     database_path = ""

DATABASE_PATH=database_path