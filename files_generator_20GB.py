import os
import hashlib

base_dir = "./files"
os.makedirs(base_dir, exist_ok=True)
num_files = 2_300_000
file_size = 10720

for i in range(1, num_files + 1):
    subdir = os.path.join(base_dir, f"{i // 10000:04d}")
    os.makedirs(subdir, exist_ok=True)
    file_path = os.path.join(subdir, f"file_{i}.txt")
    
    # Generate deterministic content of the required size
    content = hashlib.sha256(str(i).encode()).hexdigest()
    content = (content * ((file_size // len(content)) + 1))[:file_size]
    
    with open(file_path, "w") as f:
        f.write(content)
    
    if i % 100000 == 0:
        print(f"Created {i} files")
