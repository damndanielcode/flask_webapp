from functools import wraps
from flask import abort

def requires_db():
    def requires_db_decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            if app.config.get('DATABASE_URI') is None:
                abort(400)
            return f(*args, **kwargs)
        return wrapper
    return requires_db_decorator
