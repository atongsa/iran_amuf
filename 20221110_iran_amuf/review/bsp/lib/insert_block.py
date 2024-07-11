#!/usr/bin/env python3

# lib
import sys
import shutil

# args
m_d = sys.argv[1]  # name of config
i_s = sys.argv[2]  # insert_block
line_num = sys.argv[3]  # before_line-1
new_f = sys.argv[4] # new_file

index = int(line_num)

# cp
shutil.copy(m_d, new_f)

# Open the Python file in write mode
with open(new_f, 'r+') as f:
    # Read the contents of the Python file
    contents = f.readlines()
    # Open the block file
    with open(i_s, 'r') as block_file:
        # Read the contents of the block file
        block_contents = block_file.readlines()
    # Find the index of the line you want to insert the block before
    #index = contents.index(line_num)
    # Insert the block contents before the line
    contents = contents[:index] + block_contents + contents[index:]
    # Write the updated contents to the Python file
    f.seek(0)
    f.writelines(contents)

# kk
