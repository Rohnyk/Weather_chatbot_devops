from flask import Flask, redirect, url_for, request, render_template
import requests
import json

app = Flask(__name__, template_folder= 'Templates')


@app.route('/')
def index():
  return render_template('index.html')

@app.route("/get")
def get_bot_response():    
  val = str(request.args.get('msg'))
  data = json.dumps({"message": val})
  headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
  res = requests.post('http://127.0.0.1:5005/webhooks/rest/webhook', data= data, headers = headers)
  res = res.json()
  print(res)
  val = res[0]['text']
  return str(val) 

if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')