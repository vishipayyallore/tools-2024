import hashlib
import base64


def calculate_sha256_base64(input_string: str) -> str:
    # Calculate SHA-256 hash
    sha256_hash = hashlib.sha256(input_string.encode()).digest()

    # Convert the hash to a Base64-encoded string
    base64_hash = base64.b64encode(sha256_hash).decode()

    return base64_hash


# Example usage:
password = "Sample@123$"
result = calculate_sha256_base64(password)
print( f'Password: {password} \nHash: {result}')

password = "secret"
result = calculate_sha256_base64(password)
print( f'Password: {password} \nHash: {result}')
