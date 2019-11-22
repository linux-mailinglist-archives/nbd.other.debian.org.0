Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24910741B
	for <lists+nbd@lfdr.de>; Fri, 22 Nov 2019 15:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3E646202FA; Fri, 22 Nov 2019 14:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 22 14:36:09 2019
Old-Return-Path: <brogeriofernandes@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 864EB2033D
	for <lists-other-nbd@bendel.debian.org>; Fri, 22 Nov 2019 14:18:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qt21WXl5AcA7 for <lists-other-nbd@bendel.debian.org>;
	Fri, 22 Nov 2019 14:18:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 21F912016F
	for <nbd@other.debian.org>; Fri, 22 Nov 2019 14:18:17 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y10so7977098qto.3
        for <nbd@other.debian.org>; Fri, 22 Nov 2019 06:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=8TvceJk8naFe0wGfVb++o3KqUAJeAo3TzFXFMpEnPO0=;
        b=l9rv7zwsWSt8uqDMvw7gFMafYA9/0ZA1+hk5tNnmYBNa1hKz8C1rP1El2TV2JJawly
         S/thNeo1cK0mkZW8Ktk1Z0m7DDwoGtneODNVu5OCnDHMAmGORMEN1zqES8W1e/6C5jwr
         DtVzlNmwFmFMg90E62tuCTspdxDLZgehx44VIvPJC/kbuM1H/4X8DkgyeVDaOmQPS3g4
         tGI/D3TOF3dcIeYqgJE0lF6UDT4KZ3oIQOUs68OIWCGUp05muMGMgENrhyXasWa5kWtm
         MmmzBWeNo0fKLRAxJBYRhicOwvCWzI+a8f1dMHsiJxgY10kvY6vbuT7tR0THwAgUs6V5
         /TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8TvceJk8naFe0wGfVb++o3KqUAJeAo3TzFXFMpEnPO0=;
        b=F8sCYH8ADFl6sVSJ0gnOqwEKunMADniY4+gN+9EPdlb0iTIqOf8O23UwTPqM2ulpnz
         QNgtQgQP7iode4LGfafOHCZbKsfMX2nixJoCMmeSyNF7VFvDTlMziv0NmUJjm9F5vGDM
         p02fLnu5h3Q8Gl8hP3vmjq4vTvCA0Syn44LwN+XfXCPYH8LWkAoevi79DJ1+70FBPR/p
         nUFATEYpUcmnrzzE7K3/dRzGUk4LJgkeyqDJ6wgFuyP8AzxANEQ/g17o9r7nCiAV++m9
         Kg2PP5KJDE9UwLx1SMiYbEI1efC2o12ceTNKtyXK6BxdH2qmFAW23wzhDNo3NZa8q7a9
         fm+A==
X-Gm-Message-State: APjAAAVLIx14Hm5C/sO4s4QPsLyXLaJik0M98q5l1PyCc1Mozv68F3mg
	Tt2unWGgbOtyoH9/t2mjQIVBFHWcCGnHCHWo8k5HPdI0yQ==
X-Google-Smtp-Source: APXvYqyaiViCmXwTOquWFOzV6Qnkf3ZtU/uLRmwirDpNCmPina3yG3r/OqKy0ETQBsrP1xV9Ic/MrrXqnGo9e0IvGkE=
X-Received: by 2002:aed:24c1:: with SMTP id u1mr4891628qtc.29.1574432293482;
 Fri, 22 Nov 2019 06:18:13 -0800 (PST)
MIME-Version: 1.0
From: Bruno Rogerio Fernandes <brogeriofernandes@gmail.com>
Date: Fri, 22 Nov 2019 11:18:23 -0300
Message-ID: <CAO64-qXGkW7M229sFoJnJLOk41YsnEmdv=HZnWGSurWVcti-Ww@mail.gmail.com>
Subject: Can't persist connection
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="0000000000009376c30597f01573"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z9p5MH9te-N.A.mYB.ZJ_1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/749
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAO64-qXGkW7M229sFoJnJLOk41YsnEmdv=HZnWGSurWVcti-Ww@mail.gmail.com
Resent-Date: Fri, 22 Nov 2019 14:36:09 +0000 (UTC)

--0000000000009376c30597f01573
Content-Type: text/plain; charset="UTF-8"

Hello there

I don't know if I'm doing anything wrong, but I can't keep a
persistent connection between an nbd-client and an nbd-server. Upon
nbd-server shutdown/restart, the client immediately exits with "Kernel call
returned.sock, done"

Firstly I tried to update everything, using the latest server and client,
same result.

The server settings is the following:
[myexport]

exportname = /srv/nbd/export-file

copyonwrite = false

readonly = false


my client is using the following command line:
nbd-client -N myexport nbdserver /dev/nbd0 -t 6 -persist -nofork

What am I doing wrong?

Thanks for your help

--0000000000009376c30597f01573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there<div><br></div><div>I don&#39;t know if I&#39;m=
 doing anything wrong, but I can&#39;t keep a persistent=C2=A0connection be=
tween an nbd-client and an nbd-server. Upon nbd-server shutdown/restart, th=
e client immediately=C2=A0exits with &quot;Kernel call returned.sock, done&=
quot;</div><div><br></div><div>Firstly I tried to update everything, using =
the latest server and client, same result.</div><div><br></div><div>The ser=
ver settings is the following:</div><div><font face=3D"monospace">[myexport=
]</font></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;paddi=
ng:0px"><div><font face=3D"monospace">exportname =3D /srv/nbd/export-file</=
font></div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;=
padding:0px"><div><font face=3D"monospace">copyonwrite =3D false</font></di=
v></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px"><div><font face=3D"monospace">readonly =3D false</font></div></blockquo=
te></div><div><div><br></div></div><div>my client is using the following co=
mmand line:</div><div><font face=3D"monospace">nbd-client -N myexport nbdse=
rver /dev/nbd0 -t 6 -persist -nofork<br></font></div><div><br></div><div>Wh=
at am I=C2=A0doing wrong?</div><div><br></div><div>Thanks for your help</di=
v></div>

--0000000000009376c30597f01573--

