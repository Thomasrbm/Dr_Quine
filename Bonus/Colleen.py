# Hello
s = '# Hello\ns = %r\ndef ft_print(data):\n\tprint(data %% data, end="")\nif __name__ == "__main__":\n\t# World\n\tft_print(s)\n'
def ft_print(data):
	print(data % data, end="")
if __name__ == "__main__":
	# World
	ft_print(s)