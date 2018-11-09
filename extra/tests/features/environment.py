import sys

def before_all(context):
	sys.path.append('./steps/');
	if ("interfaz" not in context.config.userdata):
		#por defecto, interfaz HTTP
		interfaz="http"
	else:
		interfaz=context.config.userdata["interfaz"]

	if ("host" not in context.config.userdata):
		#por defecto, localhost
		context.host="localhost"
	else:
		context.host=context.config.userdata["host"]

	if ("port" not in context.config.userdata):
		#por defecto, localhost
		context.port="4477"
	else:
		context.port=context.config.userdata["port"]

	if ("timeout" not in context.config.userdata):
		#por defecto 120 segundos
		context.timeout=120
	else:
		context.timeout=int(context.config.userdata["timeout"])

	if (interfaz=="websocket"):
		context.url="ws://"+context.host+":"+context.port+"/ws"
		from websocket_steps import websocket_steps
	else:	
		if (interfaz=="http"):
			context.url="http://"+context.host+":"+context.port+"/abadIA/game"
			from http_steps import http_steps
		#por defecto, interfaz HTTP
		else:
			context.url="http://"+context.host+":"+context.port+"/abadIA/game"
			from http_steps import http_steps
