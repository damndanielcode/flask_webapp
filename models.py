from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, engine, Column, String, Integer, ForeignKey, Boolean, DateTime
import os


deployment_location = os.environ.get('DEPLOYMENT_LOCATION')
db_name = os.environ.get('DB_NAME')
db_user_name = os.environ.get('DB_USER_NAME')
db_password = os.environ.get('DB_PASSWORD')
db_connector = os.environ.get('DB_CONNECTOR')
db_port = os.environ.get('DB_PORT')


if deployment_location == "local":
   db_host = os.environ.get('DB_HOST')
   database_path = "{}://{}:{}@{}:{}/{}".format(db_connector, db_user_name, db_password, db_host, db_port, db_name)

elif deployment_location == "gcp":
    unix_socket_path = os.environ.get('INSTANCE_UNIX_SOCKET')
    database_path = "{}://{}:{}@/{}?unix_sock={}/.s.PGSQL.{}".format(db_connector, db_user_name, db_password, db_name, unix_socket_path, db_port)

elif deployment_location == "microsoft":
    conn_str = os.environ.get('AZURE_POSTGRESQL_CONNECTIONSTRING')
    conn_str_params = {pair.split('=')[0]: pair.split('=')[1] for pair in conn_str.split(' ')}
    database_path = 'postgresql://{dbuser}:{dbpass}@{dbhost}/{dbname}'.format(
        dbuser=conn_str_params['user'],
        dbpass=conn_str_params['password'],
        dbhost=conn_str_params['host'],
        dbname=conn_str_params['dbname']
    )

else:
    database_path = ""

db = SQLAlchemy()

'''
    setup_db(app)
    binds a flask application and a SQLAlchemy service

'''

def setup_db(app, database_path=database_path):
    app.config["SQLALCHEMY_DATABASE_URI"] = database_path
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    db.app = app
    db.init_app(app)
    db.create_all()


#----------------------------------------------------------------------------#
# Models.
#----------------------------------------------------------------------------#

class Venue(db.Model):
    __tablename__ = 'Venue'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    genres = Column(String(120))
    address = Column(String(120))
    city = Column(String(120))
    state = Column(String(120))
    phone = Column(String(120))
    website = Column(String(500))
    facebook_link = Column(String(120))
    seeking_talent = Column(Boolean, default=False)
    seeking_description = Column(String)
    image_link = Column(String(500))
    shows = db.relationship('Show', backref='Venue', lazy='dynamic')


class Artist(db.Model):
    __tablename__ = 'Artist'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    genres = Column(String(120))
    city = Column(String(120))
    state = Column(String(120))
    phone = Column(String(120))
    website = Column(String(500))
    facebook_link = Column(String(120))
    seeking_venue = Column(Boolean, default=False)
    seeking_description = Column(String)
    image_link = Column(String(500))
    shows = db.relationship('Show', backref='Artist', lazy='dynamic')


class Show(db.Model):
    __tablename__ = 'Show'
    id = Column(Integer, primary_key=True)
    venue_id = Column(Integer, ForeignKey('Venue.id'), nullable=False)
    artist_id = Column(Integer, ForeignKey('Artist.id'), nullable=False)
    start_time = Column(DateTime(timezone=True))
