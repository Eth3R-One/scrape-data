from pathlib import Path
import os
from dotenv import load_dotenv

load_dotenv()

BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(str(BASE_DIR / ".env"))

def get_env_variable(var_name):
    value = os.getenv(var_name)
    if value is None or value == "":
        raise RuntimeError(f"Environment variable '{var_name}' is not set or empty.")
    return value

def get_env_without_exception(var_name):
    return os.getenv(var_name)