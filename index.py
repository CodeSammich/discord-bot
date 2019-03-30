# https://zeit.co/examples/python/
# For deployment on Zeit Now, is not required for Discord Bot itself
# Also see now.json
from http.server import BaseHTTPRequestHandler
class handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(str("Hilla Bot is now running on Now 2.0!").encode())
        return