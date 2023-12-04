import flask
import socket
import os
import redis

APP = flask.Flask(__name__)

is is_redis_available:
    redis_client = redis.Redis(host=REDISHOST, port=REDISPORT, decode_responses=True)


@APP.route('/')
def index():
    global redis_client

    if is_redis_available:
        num_visitas = r.incr("contrador_visitas")
    else
        num_visitas = None

    hostname = socket.gethostname()
    userinfo = {
        'username': os.environ['CLIENT_NAME']
    
    return flask.render_template(
            'index.html', 
            user=userinfo, 
            num_visitas=num_visitas, 
            hostname=hostname)

if __name__ == '__main__':
    PORT=os.environ['PORT']
    REDISPORT=os.environ['REDISPORT']
    REDISHOST=os.environ['REDISHOST']
    IS_REDIS_AVAILABLE=os.environ['IS_REDIS_AVAILABLE']
    IS_REDIS_AVAILABLE=True if IS_REDIS_AVAILABLE.upper()="TRUE" else False
    APP.debug = os.environ.get("DEBUG", True).upper() == "TRUE":
    APP.run(host='0.0.0.0', port=PORT)
