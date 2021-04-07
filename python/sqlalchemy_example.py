# pip install psycopg2-binary
# sqlacodegen postgres://user:passwd@host:ip/database --outfile model.py

from sqlalchemy import create_engine
from sqlalchemy import Column, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

db_string = "postgres://admin:donotusethispassword@aws-us-east-1-portal.19.dblayer.com:15813/compose"

db = create_engine(db_string)
base = declarative_base()


class Film(base):
    __tablename__ = "films"

    title = Column(String, primary_key=True)
    director = Column(String)
    year = Column(String)


Session = sessionmaker(db)
session = Session()

base.metadata.create_all(db)

# Create
doctor_strange = Film(title="Doctor Strange", director="Scott Derrickson", year="2016")
session.add(doctor_strange)
session.commit()

# Read
films = session.query(Film)
for film in films:
    print(film.title)

# Update
doctor_strange.title = "Some2016Film"
session.commit()

# Delete
session.delete(doctor_strange)
session.commit()

delete_obj = Shop.__table__.delete().where(Shop.shop_cate.contains("m"))
session.execute(delete_obj)
session.commit()
