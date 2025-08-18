#!/usr/bin/env python3

"""
Simple multi-stage Python application demonstrating Grade A compliance.
"""

from flask import Flask
import numpy as np

app = Flask(__name__)

@app.route('/')
def hello():
    """Main endpoint that demonstrates multi-stage build success."""
    # Simple test that both Flask and NumPy are available
    numpy_version = np.__version__
    return f"Hello from multi-stage Python! NumPy {numpy_version} is available."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)