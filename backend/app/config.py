import os
from datetime import timedelta

SECRET_KEY = os.environ.get("SECRET_KEY", "dev-secret-key-change-me")
ALGORITHM = os.environ.get("JWT_ALGORITHM", "HS256")
ACCESS_TOKEN_EXPIRE_MINUTES = int(os.environ.get("ACCESS_TOKEN_EXPIRE_MINUTES", "30"))
REFRESH_TOKEN_EXPIRE_MINUTES = int(os.environ.get("REFRESH_TOKEN_EXPIRE_MINUTES", "10080"))

DATABASE_URL = os.environ.get("DATABASE_URL", "sqlite+pysqlite:///backend.db")

def access_token_expiry() -> timedelta:
    return timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)

def refresh_token_expiry() -> timedelta:
    return timedelta(minutes=REFRESH_TOKEN_EXPIRE_MINUTES)