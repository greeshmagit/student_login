import subprocess

# Source and destination file paths
src = "nginx:/usr/share/nginx/html/*"
dst = "ec2_user@13.127.107.231:/opt/build"

# Copy the file using SCP
subprocess.run(["scp", src, dst])

'''
from subprocess import subprocess
p = subprocess.Popen(["scp", "index.html", "ec2@13.127.107.231:/opt/build"])
sts = os.waitpid(p.pid, 0)
'''
