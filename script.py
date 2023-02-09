from subprocess import subprocess
p = subprocess.Popen(["scp", "index.html", "ec2@13.127.107.231:/opt/build"])
sts = os.waitpid(p.pid, 0)
