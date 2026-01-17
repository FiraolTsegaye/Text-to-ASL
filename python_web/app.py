from flask import Flask, render_template, request, jsonify, send_from_directory
import os
from logic import text_to_asl, get_available_words
import webbrowser
import threading
import time

app = Flask(__name__)

# --- TERMINAL INPUT THREADING ---
import threading, queue, sys
cmd_queue = queue.Queue()

def input_loop():
    print("\n[SYSTEM] Type text & hit Enter to Sign:")
    while True:
        try:
            txt = sys.stdin.readline()
            if txt: cmd_queue.put(txt.strip())
        except: break

t = threading.Thread(target=input_loop, daemon=True)
t.start()

# --- AUTO OPEN CHROME ---
def open_browser():
    time.sleep(2)  # Wait for server to start
    try:
        webbrowser.get('chrome').open('http://127.0.0.1:5000')
    except:
        try:
            # Windows Chrome path
            import subprocess
            subprocess.Popen([r'C:\Program Files\Google\Chrome\Application\chrome.exe', 'http://127.0.0.1:5000'])
        except:
            try:
                # Fallback Windows Chrome path
                subprocess.Popen([r'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe', 'http://127.0.0.1:5000'])
            except:
                print("⚠ Could not auto-open Chrome. Manually visit: http://127.0.0.1:5000")

@app.route('/poll')
def poll():
    if not cmd_queue.empty(): return jsonify({'command': cmd_queue.get()})
    return jsonify({'command': None})

# Configuration to serve images from the parent directory
IMAGES_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'images'))

@app.route('/images/<path:filename>')
def serve_image(filename):
    return send_from_directory(IMAGES_DIR, filename)

@app.route('/')
def home():
    # Redirect or render 3D view as default
    return render_template('3d_avatar.html')

@app.route('/2d')
def legacy_2d():
    return render_template('index.html')

@app.route('/translate', methods=['POST'])
def translate():
    data = request.get_json()
    text = data.get('text', '')
    result = text_to_asl(text)
    # Prefix paths with /images/
    result['paths'] = [f"/images/{p}" for p in result['paths']]
    return jsonify(result)

@app.route('/words', methods=['GET'])
def list_words():
    words = get_available_words()
    return jsonify({"words": words})

if __name__ == '__main__':
    # Auto-open Chrome in background
    browser_thread = threading.Thread(target=open_browser, daemon=True)
    browser_thread.start()
    
    app.run(debug=True, port=5000)
