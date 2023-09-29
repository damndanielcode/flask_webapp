from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, String, Integer, ForeignKey, Boolean, DateTime
import os

# For using locally
#database_path = "postgresql://{}:{}@{}:{}/{}".format(db_user_name, db_password, db_host, '5432', database_name)

# For production
database_name = os.environ.get('DB_NAME')
db_user_name = os.environ.get('DB_USER_NAME')
db_password = os.environ.get('DB_PASSWORD')
db_host = os.environ.get('DB_HOST')
db_connector = os.environ.get('DB_CONNECTOR')
db_port = os.environ.get('DB_PORT')
database_path = "{}://{}:{}@{}:{}/{}".format(db_connector, db_user_name, db_password, db_host, db_port, database_name)

db = SQLAlchemy()

'''
    setup_db(app)
    binds a flask application and a SQLAlchemy service


def setup_db(app, database_path=database_path):
    app.config["SQLALCHEMY_DATABASE_URI"] = database_path
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    db.app = app
    db.init_app(app)
    db.create_all()
'''

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
