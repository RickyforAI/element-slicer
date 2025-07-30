#!/usr/bin/env python3
"""
简单的HTTP服务器用于测试游戏
使用方法: python3 server.py
然后访问 http://YOUR_SERVER_IP:8000
"""

import http.server
import socketserver
import os

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # 添加CORS头，允许跨域访问
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

# 切换到当前目录
os.chdir(os.path.dirname(os.path.abspath(__file__)))

with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
    print(f"服务器运行在 http://0.0.0.0:{PORT}")
    print(f"请在浏览器访问: http://YOUR_SERVER_IP:{PORT}")
    print("按 Ctrl+C 停止服务器")
    httpd.serve_forever()