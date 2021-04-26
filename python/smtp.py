import os
import smtplib
from email.mime.text import MIMEText
from email.utils import formataddr

from email.mime.multipart import MIMEMultipart
#  from email.mime.text import MIMEText
from email.mime.image import MIMEImage

from loguru import logger


def sender_text():
    logger.info("start sending")
    sender = ""
    receiver = ""
    password = ""
    smtp_server = "smtp.163.com"
    try:
        content = "\tsend ip address\n\n\n%s" % os.popen("ifconfig").read()
        msg = MIMEText(
            "address: https://github.com/formattedd/questions \n message is :\n%s"
            % content,
            "plain",
            "utf-8",
        )
        msg["From"] = formataddr(["Server", sender])
        msg["To"] = formataddr(["engineer", receiver])
        msg["Subject"] = "python test mail "  # title

        server = smtplib.SMTP(smtp_server, 25)
        server.login(sender, password)
        server.sendmail(
            sender,
            [
                receiver,
            ],
            msg.as_string(),
        )
        server.quit()
        logger.info("success send")
    except Exception as err:
        logger.error(err)


def SendPng(filename):
    username = ""
    password = ""
    sender = ""
    receiver = ""
    #  smtp_server = "smtp.163.com"
    smtp_server = "smtp.qq.com"

    msg = MIMEMultipart("alternative")
    msg["Subject"] = "Link"
    msg["From"] = sender
    msg["To"] = receiver

    # Create the body of the message (a plain-text and an HTML version).
    text = "My Daily Work"
    html = """\
    <html>
      <head></head>
      <body>
        <img src="cid:image1" alt="Logo" style="width:250px;height:50px;"><br>
      </body>
    </html>
    """

    part1 = MIMEText(text, "plain")
    part2 = MIMEText(html, "html")

    msg.attach(part1)
    msg.attach(part2)
    with open(filename, "rb") as file:
        msgImage = MIMEImage(file.read())
    msgImage.add_header("Contenc-ID", "<image1>")
    msg.attach(msgImage)

    s = smtplib.SMTP(smtp_server)
    s.login(username, password)
    s.sendmail(sender, receiver, msg.as_string())
    s.quit()
    print("send success !")


if __name__ == "__main__":
    sender_text()
