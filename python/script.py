import os
import json
import time
from mitmproxy import flow


def response(flow):

    result = {}
    result['request'] = {}
    for k,v in flow.request.headers.items():
        result['request'][k] = v
    # result['url'] = flow.request.url

    _response = flow.response
    result['status_code'] = _response.status_code
    # result['headers'] = _response.headers
    result['text'] = _response.text
    # result['text'] = _response.content.decode('utf-8')
    print(result)
    # logger(result)


def logger(message):
    print(message)
    with open('logs/%s.log'% __file__.strip('.py'), 'a') as file:
        file.write('%s :: %s\n' % (time.ctime(), json.dumps(message)))

def run():
    command = 'mitmdump -p 8080 -s %s' % __file__
    os.system(command)


if __name__ == '__main__':
    if not os.path.exists('logs'):
        os.mkdir('logs')
    run()
