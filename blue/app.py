# This file defines a simple web application using Flask.
# The application has a single route (root URL '/') that returns the message "Blue Version Active".
# The application runs on host 0.0.0.0 and port 5000 when executed directly.

from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Blue Version Active"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

