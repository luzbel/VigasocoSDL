import sys

def before_all(context):
	sys.path.append('./steps/');
	if ("interfaz" not in context.config.userdata):
		#por defecto, interfaz HTTP
		interfaz="http"
	else:
		interfaz=context.config.userdata["interfaz"]
	if (interfaz=="websocket"):
		from websocket_steps import websocket_steps
	else:	
		if (interfaz=="http"):
			from http_steps import http_steps
#por defecto, interfaz HTTP
		else:
			from http_steps import http_steps

