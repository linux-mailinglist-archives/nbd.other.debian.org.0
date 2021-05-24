Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090638E831
	for <lists+nbd@lfdr.de>; Mon, 24 May 2021 16:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0DD6220556; Mon, 24 May 2021 14:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 24 14:00:10 2021
Old-Return-Path: <taylor.swift@infodbbusiness.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SUBENDNUM
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5E1C92057B
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 May 2021 13:44:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.79 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001, SUBENDNUM=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 54DEp4p90uMH for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 May 2021 13:44:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .infodbbusiness. - helo: .mail-ot1-x333.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C6A0120583
	for <nbd@other.debian.org>; Mon, 24 May 2021 13:44:50 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so25252247otc.6
        for <nbd@other.debian.org>; Mon, 24 May 2021 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=infodbbusiness.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=IQQzvPbSyLf43IoCWu9wljq4aEpw7aaccuwbgi+GNfg=;
        b=pcA6D+Tge3EmlJcqdBdmUSLFAdLWKSqGggFrBW66l36gnqxmpytvZ/yDgqXvqgBrs1
         Mcyo8eHwD0MjiSs359otM+DCQymRW3vgdntvPv5ioMtAmQurI6d68IHuGiV9Fkx0Kk9j
         XiPj31pQWY3zE6dYtToNIGkQUESzpWIyJw/VBjRrxeKc7SWL/ZLe+p4kB+qXyNwi2Jsw
         cipdIwGnDyTLG873EnYs/QAH3K9/lOZ0/+bXJMT6IqgFkEmcxTpo4SBa4VzSvvdNrvV/
         z4M33puWzZc7EIPFuF0vFWuSMVX0Fccdm8VprDjsrpY9BNGl+N3kmZPg4v8wZ/2n0eLK
         wUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IQQzvPbSyLf43IoCWu9wljq4aEpw7aaccuwbgi+GNfg=;
        b=n/RF+npNx+XxLaDyQj5EWlY+TiB4WgHqXBQuCEVH9kr0XuSwzNkHJVa7eLkjoT3OBJ
         3245xwhPIXDDU3Subj4Q3IwHQMYOgGUT2aVQm1X9soC6Jq1ixiiHvIDIAW9ntNXRyNT0
         u5yjYbjR5BFwdVh8vnrNPKgwhCraubzuWWLjXuaG9Py0TWjXJHzUT1NhDz26efsZ2NCd
         EaoFb7W5E4t4YFqxqADq+s77tQ2Sdal7BY06F1kpd3fcs1Oyidq7I4dJ2h7/lQdOwv+X
         fm/i8DDZ8c9C3aN7rCt7MIc1nlfQ01Pp7+W5C7iVEMOJZoTg+M0oM9oNSmIYro24AJc7
         bUvA==
X-Gm-Message-State: AOAM533QcX/h6H/8bMtk4OKEleEHJzU7o2tHZVc4q7Qu1zXKF7D2Cl0t
	xmYHoqOyM9HVR/7aqbolcUtRkd4QB/m38q8dAzMTfg==
X-Google-Smtp-Source: ABdhPJyJEozxDCJ2o4A6GslV4qlqGgl8CtnQQosntOqmrKqa2q4dXeZh7n4fr8FjHB0s6kBWJC415ufHvqyuCB1Vub4=
X-Received: by 2002:a9d:6e7:: with SMTP id 94mr16586907otx.366.1621863886817;
 Mon, 24 May 2021 06:44:46 -0700 (PDT)
MIME-Version: 1.0
From: Taylor Swift <taylor.swift@infodbbusiness.com>
Date: Mon, 24 May 2021 19:14:31 +0530
Message-ID: <CAMEWrX7NCEHEU079an-uZm_MmPLFyYWMdK4OZQj+vN4+UpiVDQ@mail.gmail.com>
Subject: International Linemans Rodeo & Expo, Updated b2b and Attendees
 contact database-2021
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000d9233e05c3139cfd"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gpaqs4PVJbH.A.Cq.qF7qgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1167
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMEWrX7NCEHEU079an-uZm_MmPLFyYWMdK4OZQj+vN4+UpiVDQ@mail.gmail.com
Resent-Date: Mon, 24 May 2021 14:00:10 +0000 (UTC)

--000000000000d9233e05c3139cfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey there,


Hope you doing well!

I came to know that you are interested in acquiring the attendee=E2=80=99s =
list for
the show.



Show:  *International Linemans Rodeo & Expo 2021*
Counts:   * 18,758*


We feel this definitely brings some changes to your business growth, we
will be happy to send additional information for your review.

Please send me your target audience and geography, so that I can send
counts and pricing details.

Target Industry:  _____________?

Target Geography:  ______________?

Target Job Title:  _____________?





Thanks, and Regards,

Taylor Swift

Business Manager



If you do not wish to hear from us again, please respond back with =E2=80=
=9CLeave
Out=E2=80=9D and we will honor your request.

--000000000000d9233e05c3139cfd
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
)">Show: </span>=C2=A0<b><span style=3D"line-height:107%;font-family:Ebrima=
;color:rgb(31,56,100)">International Linemans
Rodeo &amp; Expo 2021</span></b><span style=3D"font-size:10pt;line-height:1=
07%;font-family:&quot;Segoe UI&quot;,sans-serif;color:rgb(31,56,100)"><br>
Counts:=C2=A0=C2=A0 </span><b><span style=3D"line-height:107%;font-family:E=
brima;color:rgb(31,56,100)">=C2=A018,758</span></b><b><span style=3D"color:=
black"></span></b></p>

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
2pt">Taylor
Swift</span></p>

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

--000000000000d9233e05c3139cfd--

