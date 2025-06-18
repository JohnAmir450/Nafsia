from flask import Flask, request, jsonify
from flask_cors import CORS
import time

app = Flask(__name__)  
CORS(app)

latest_data = {
    "heart_rate": None,
    "spo2": None,
    "timestamp": None
}

@app.route('/upload', methods=['POST'])
def upload_data():
    data = request.get_json()

    heart_rate = data.get('heart_rate')
    spo2 = data.get('spo2')

    if heart_rate is not None and spo2 is not None:
        latest_data['heart_rate'] = heart_rate
        latest_data['spo2'] = spo2
        latest_data['timestamp'] = time.time()

        print(f"✅ Data received: HR={heart_rate}, SpO2={spo2}")
        return jsonify({"message": "Data received successfully"}), 200
    else:
        return jsonify({"error": "Invalid data"}), 400

@app.route('/latest', methods=['GET'])
def get_latest_data():
    return jsonify(latest_data)

@app.route('/', methods=['GET'])
def index():
    return "🟢 Server is running!"

if __name__ == '__main__':  
    app.run(host='0.0.0.0', port=5000)