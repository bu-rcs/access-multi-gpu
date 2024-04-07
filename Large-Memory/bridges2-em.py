import os

def main():
    # Reserve 4TB of memory
    allocated_memory = reserve_memory(4)
    
    # Check if memory allocation was successful
    if allocated_memory:
        print("Memory allocation successful.")
        
        # Use the allocated memory
        use_memory(allocated_memory)
        
        # Clear the allocated memory
        clear_memory(allocated_memory)
        print("Memory cleared.")
    else:
        print("Failed to allocate memory.")

def reserve_memory(size_in_tb):
    try:
        # Calculate size in bytes
        size_in_bytes = size_in_tb * 1024 * 1024 * 1024 * 1024
        
        # Allocate memory
        allocated_memory = bytearray(size_in_bytes)
        return allocated_memory
    except MemoryError:
        return None

def use_memory(memory):
    # Use the allocated memory (e.g., perform computations)
    pass

def clear_memory(memory):
    # Clear the allocated memory
    del memory

if __name__ == "__main__":
    main()