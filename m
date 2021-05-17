Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54D383612
	for <lists+nbd@lfdr.de>; Mon, 17 May 2021 17:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E802D202FF; Mon, 17 May 2021 15:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 17 15:30:09 2021
Old-Return-Path: <stella.bennett@stsmarketing-us.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SUBENDNUM autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9AB9E202D6
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 May 2021 15:12:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.5 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001, SUBENDNUM=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qmVFQZm-ZJZ3 for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 May 2021 15:12:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .stsmarketing-us. - helo: .mail-qv1-xf42.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D083B202CD
	for <nbd@other.debian.org>; Mon, 17 May 2021 15:12:00 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id o59so3268806qva.1
        for <nbd@other.debian.org>; Mon, 17 May 2021 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stsmarketing-us-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=rOtx/zW8KBEZDFTY82rmcICrzDP5tkkePDppUWZbaE4=;
        b=02oUQ1rgDjxO2xdcttseXGLYStJPZNzzzjHMjD6bHdmND0NWrz4kCpAHxI14D/L0NX
         +iqlSNHua4Bzctta7aE/sjOjbVG2ye7RzXn/eYHEKV4++zYt7SX7Zzx4sYj6xGPv6nRp
         xW5PqYgSsDg6+dDyy8VN7qkLik9KHLehJ6Xy8PHhGsuhZhYEGjllEVQ97gsffe8p2d5K
         SZGPdujJiy3NbgijNoi/jGvI3vFK5EOiXr9MX/8B1CBI30lRrnRETVx1zKzCTZND4WqO
         P3Lf/KzaOGKG/PgFf+rJxK8hRer6sr1oaMmMibJDIxrrFDuZyeGottkiF1jWbVb/NUVt
         xPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rOtx/zW8KBEZDFTY82rmcICrzDP5tkkePDppUWZbaE4=;
        b=BVZ4dZ0CCLICCTiAIVvK/qZ09ztZgutaoefpksjXWfhzNm2Z9Tf+jXXuXjwAHy2D7D
         wP/DZN9V9hHok6GrAsprCyMJMUfiAjw0C8xoWdL6WNO2Tb3SwVWOGDdw7s2s00hwP5Hq
         WZqqZ0xtQVQcBCcbsMPp7kSZYJ5XVMCXsmbQ1KP/7uEn9pSz0j1Aq9FOIRHWFcg+87/e
         qZD6MaB7wyl/WZmryeG7Er4wdNsksrMFqEmeD+ta0ou39xKD26IonYSpQQQQ8KAPRcr2
         4BhABIN3Lqn5nCIHEF1BQvaTgHg2NXMQWQGPKp2H7UKDrjkogNN/l3RXcStoRgQR5kMp
         F4BQ==
X-Gm-Message-State: AOAM532N1Wb0h9vbFQZXhjDb3IusYdVPu6xg30AxvVRTDry92WEIvSiY
	CGqBgvNPY75VKLjmkqUPmBYcnnOUAByxU2TMtSdXZw==
X-Google-Smtp-Source: ABdhPJyMCv7oHajTeLbSajsdmBbR/dYUqDsgRn51UItMag4hjYA7lT+/9ncyFhXlhy+3iRpYYRre+7Gm8fT7T69PrxY=
X-Received: by 2002:a0c:c245:: with SMTP id w5mr88111qvh.36.1621264317422;
 Mon, 17 May 2021 08:11:57 -0700 (PDT)
MIME-Version: 1.0
From: Stella Bennett <stella.bennett@stsmarketing-us.com>
Date: Mon, 17 May 2021 20:41:34 +0530
Message-ID: <CAHbjO9uOsH87aoXiyGsgbe4XycBg0AUnvL+1YeAYEBDtr0kq4w@mail.gmail.com>
Subject: International Big Data Expo, Updated b2b and Attendees contact database-2021
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000ba32dc05c2880345"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8YHeKFDXdXG.A.a3.BwoogB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1159
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHbjO9uOsH87aoXiyGsgbe4XycBg0AUnvL+1YeAYEBDtr0kq4w@mail.gmail.com
Resent-Date: Mon, 17 May 2021 15:30:09 +0000 (UTC)

--000000000000ba32dc05c2880345
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey there,


Hope you doing well!

I came to know that you are interested in acquiring the attendee=E2=80=99s =
list for
the show.



Show: *International Big Data Expo 2021*
Counts:   *3,975*


We feel this definitely brings some changes to your business growth, we
will be happy to send additional information for your review.

Please send me your target audience and geography, so that I can send
counts and pricing details.

Target Industry:  _____________?

Target Geography:  ______________?

Target Job Title:  _____________?





Thanks, and Regards,

Stella Bennett

Business Manager



If you do not wish to hear from us again, please respond back with =E2=80=
=9CLeave
Out=E2=80=9D and we will honor your request.

--000000000000ba32dc05c2880345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;li=
ne-height:normal;font-size:11pt;font-family:Calibri,sans-serif"><span style=
=3D"font-size:10pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31=
,56,100)">Hey there,</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)"><br>
Hope you doing well!<br>
<br>
</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">I came =
to know that you are interested in acquiring the
attendee=E2=80=99s list for the show.</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">=C2=A0<=
/span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10pt;line-=
height:107%;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100=
)">Show:</span> <b><span style=3D"line-height:107%;font-family:Ebrima;color=
:rgb(31,56,100)">International Big Data
Expo 2021</span></b><span style=3D"font-size:10pt;line-height:107%;font-fam=
ily:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)"><br>
Counts:=C2=A0=C2=A0 </span><b><span style=3D"line-height:107%;font-family:E=
brima;color:rgb(31,56,100)">3,975</span></b><b><span style=3D"color:black">=
</span></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)"><br>
We feel this definitely brings some changes to your business growth, we wil=
l be
happy to send additional information for your review.<br>
<br>
Please send me your target audience and geography, so that I can send count=
s
and pricing details.<b></b></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">Target =
Industry:=C2=A0
_____________?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">Target =
Geography:=C2=A0
______________?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">Target =
Job Title:=C2=A0 _____________?</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">=C2=A0<=
/span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">=C2=A0<=
/span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:10p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">Thanks,=
 and Regards,</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:16.5pt;=
background-image:initial;background-position:initial;background-size:initia=
l;background-repeat:initial;background-origin:initial;background-clip:initi=
al;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:=
12pt;font-family:Helvetica,sans-serif;color:rgb(32,33,36);letter-spacing:0.=
2pt">Stella
Bennett</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:16.5pt;=
background-image:initial;background-position:initial;background-size:initia=
l;background-repeat:initial;background-origin:initial;background-clip:initi=
al;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:=
10pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)">Busi=
ness Manager</span><span lang=3D"EN-IN" style=3D"font-size:12pt;font-family=
:Helvetica,sans-serif;color:rgb(32,33,36);letter-spacing:0.2pt"></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;line-height:normal;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:12p=
t;font-family:&quot;Times New Roman&quot;,serif;color:rgb(31,56,100)">=C2=
=A0</span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in 0in 0.0001pt;te=
xt-align:center;line-height:normal;font-size:11pt;font-family:Calibri,sans-=
serif"><span style=3D"font-size:10pt;font-family:&quot;Segoe UI&quot;,sans-=
serif;color:rgb(142,170,219)">If you do not wish to hear from us
again, please respond back with =E2=80=9CLeave Out=E2=80=9D and we will hon=
or your request.</span></p></div>

--000000000000ba32dc05c2880345--

