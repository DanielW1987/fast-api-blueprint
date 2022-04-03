from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from app.core.config import settings

database_uri = settings.SQLALCHEMY_DATABASE_URI
if settings.USE_FILE_BASED_DB:
    engine = create_engine(database_uri, connect_args={"check_same_thread": False})
else:
    engine = create_engine(database_uri, pool_pre_ping=True)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
