from flask import Flask
import os
import socket
from datetime import datetime

app = Flask(__name__)


@app.route("/")
def home():
    hostname = socket.gethostname()
    env_name = os.getenv("APP_ENV", "production")
    now = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")

    return f"""
    <html>
        <head>
            <title>Terraform AWS Demo</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    background: #f4f7fb;
                    margin: 40px;
                }}
                .card {{
                    max-width: 720px;
                    background: white;
                    padding: 24px;
                    border-radius: 12px;
                    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
                }}
                h1 {{
                    color: #1f4b99;
                }}
            </style>
        </head>
        <body>
            <div class="card">
                <h1>Terraform + AWS + GitHub Actions Demo</h1>
                <p>This application is deployed automatically from GitHub Actions to EC2 instances.</p>
                <p><strong>Environment:</strong> {env_name}</p>
                <p><strong>Server Hostname:</strong> {hostname}</p>
                <p><strong>Current Time:</strong> {now}</p>
            </div>
        </body>
    </html>
    """


@app.route("/health")
def health():
    return {"status": "ok"}, 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
