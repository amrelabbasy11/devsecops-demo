# test.py
API_KEY = "hardcoded_secret_123"  # detect-secrets will catch this

def handler():
    print("Hello from insecure code!")

handler()
