import os
s = 'import os\ns = %r\nnb = %d\nif os.path.exists("Sully_%%d.py" %% nb):\n\tnb -= 1\nif nb >= 0:\n\tf = open("Sully_%%d.py" %% nb, "w")\n\tf.write(s %% (s, nb))\n\tf.close()\n\tos.system("python3 Sully_%%d.py" %% nb)\n'
nb = 5
if os.path.exists("Sully_%d.py" % nb):
	nb -= 1
if nb >= 0:
	f = open("Sully_%d.py" % nb, "w")
	f.write(s % (s, nb))
	f.close()
	os.system("python3 Sully_%d.py" % nb)