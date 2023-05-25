from flask import Flask, render_template
import json
import requests

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html')

@app.route("/catfact", methods=["GET"])
def get_catfact():
    try: 
        URL = "https://catfact.ninja/fact"
        fact = json.loads(requests.get(url=URL).content)["fact"]
        return "<h2>Today cat fact:</h2> <h1>"+fact+"</h1>"
    except:
        traceback.print_exc()
    

if __name__ == '__main__':
	
    app.run(debug=True)
