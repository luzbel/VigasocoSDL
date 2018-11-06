import sys

def before_all(context):
	sys.path.append('./steps/');
	if (context.config.userdata["interfaz"]=="websocket"):
		from websocket_steps import websocket_steps
	else:	
		from http_steps import http_steps

