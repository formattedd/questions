# coding:utf-8
import sys
import requests
reload(sys)
sys.setdefaultencoding('utf-8')
from PyQt4 import QtCore, QtGui


class Window(QtGui.QMainWindow):
    def __init__(self):
        super(Window, self).__init__()
        self.setWindowTitle("hello")
        self.resize(200, 300)
        # 添加标签
        url = ''
        response = requests.get(url).text
        # response.encoding = 'gbk'
        # response = response.text
        label = QtGui.QLabel(response.encode('utf-8'))
        label.setAlignment(QtCore.Qt.AlignCenter)
        self.setCentralWidget(label)


app = QtGui.QApplication(sys.argv)
demo = Window()
demo.show()
app.exec_()
