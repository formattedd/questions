import os
import logging
logging.basicConfig(level=logging.INFO)

import smtplib
from email.mime.text import MIMEText
from email.utils import formataddr


def sender():
    logging.info('start sending')
    sender = ''
    receiver = ''
    password = ''
    smtp_server = 'smtp.163.com'
    try:
        content = '\tsend ip address\n\n\n%s' % os.popen('ifconfig').read()
        msg = MIMEText('message is :\n%s' % content, 'plain', 'utf-8')
        msg['From'] = formataddr(["Server", sender])
        msg['To'] = formataddr(["engineer", receiver])
        msg['Subject'] = "python test mail"  # title

        server = smtplib.SMTP(smtp_server, 25)
        server.login(sender, password)
        server.sendmail(sender, [receiver, ], msg.as_string())
        server.quit()
        logging.info('success send')
    except Exception as err:
        logging.error(err)


if __name__ == '__main__':
    sender()
