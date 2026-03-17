# Designed by a pro
A = '# Designed by a pro\nA = %r\nB = "Grace_kid.py"\nC = open(B, "w")\nC.write(A %% A)\nC.close()\n'
B = "Grace_kid.py"
C = open(B, "w")
C.write(A % A)
C.close()