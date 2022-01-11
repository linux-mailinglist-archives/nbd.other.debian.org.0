Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C348BAEB
	for <lists+nbd@lfdr.de>; Tue, 11 Jan 2022 23:45:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 92D2F2037F; Tue, 11 Jan 2022 22:45:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 11 22:45:16 2022
Old-Return-Path: <akirarosawa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,ONEWORD,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 48BFD20386
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jan 2022 22:29:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QTelRjBLR575 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jan 2022 22:29:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E32F7202DB
	for <nbd@other.debian.org>; Tue, 11 Jan 2022 22:29:19 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id w7so952768plp.13
        for <nbd@other.debian.org>; Tue, 11 Jan 2022 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lSZLLwGoAWYYGMF6SvQ0hv1Bt1QM8cnn3q546vzNHfQ=;
        b=VUXac/EsoUcUHY3pEZQkTpC0HZS6yKe0Iv6CNksaRfHWCwDMIhjDODggGgFezKT7o6
         yvpkSaKoEbG1SdOc+HDZJgooUooTFkYxmDcahe+bgoci6d8KFgvoRP4vrMMmTvE+BjuC
         uvrq2x9zbkKaHgkeeqMUzpExYJQj24UnGrufWamWb/sLwHrt9vXBV+urs94KeknmOXth
         vlfIuI4216VOrHf+HxcfZdIrdrmIGPLF4nY8wdsKwxy2lDvdzBJfgCL9F/NaHbqClCx1
         5cuyqFP8q+i1dj+Gq9ddLgULK894QmlNdAPbg2Rm7VxFodVKdQohCW7Of6zEPVjtO5xC
         6MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lSZLLwGoAWYYGMF6SvQ0hv1Bt1QM8cnn3q546vzNHfQ=;
        b=WIfQT78PtjNP6bkP9GxWVfYdN5HKG7pTEKpRiHmN4Rnk+4s04HzoUhWDejaMMUAru5
         15r93i+SdiPUq4FjMynY9LfftzueU7t92biSe9UI1rqcHEO86LI1XC9p/qjjdrsQ8lFh
         6F0ceMorCDKcGtoyjFemNAtsoFTpfD0s57OnnjjSqWvcdi5xVfIj5n4EXnqK++RCcbj2
         w4wQF7wusosiYFzPq6VtVqlLl0QVRwH+Avb398xFx7fc4djfx9VRdE6/T4W2a76ok7cP
         fHw5gCXvAwYaS77r0RTJ6ZwBDJ7+JByKZEHFC/IunH2iuSWdl8HAIfoyz7SyAYVdrz2e
         b4dg==
X-Gm-Message-State: AOAM530MjecQRdB8RjCQHhR1owZbWjbPyukLzoScjkAMdDRJL1TYw+Fc
	p6bS8gFZZVJngd3WzQVdGhRDQgpKuviea6+4NQ==
X-Google-Smtp-Source: ABdhPJx5zi6CHDgt6lWVmxjRLQxwa7IE8roLpIdxMPnCTSnihRLsPSLvesNtxYrLJAqmuRzshkCHhB887jum6D/EHRo=
X-Received: by 2002:a63:461c:: with SMTP id t28mr5833539pga.547.1641940156393;
 Tue, 11 Jan 2022 14:29:16 -0800 (PST)
MIME-Version: 1.0
From: Akira kurosawa <akirarosawa@gmail.com>
Date: Wed, 12 Jan 2022 06:29:06 +0800
Message-ID: <CAJX5Mv1-oj0MpX=k+Gucdj38wdbGN2wNet8MFMc=PxNADNTVMw@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000c3b06605d555fb84"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gaGSXz1jqlI.A.SSD.8hg3hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1673
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAJX5Mv1-oj0MpX=k+Gucdj38wdbGN2wNet8MFMc=PxNADNTVMw@mail.gmail.com
Resent-Date: Tue, 11 Jan 2022 22:45:16 +0000 (UTC)

--000000000000c3b06605d555fb84
Content-Type: text/plain; charset="UTF-8"

Hello,


My name is Low Taek Jho, a Malaysian businessman.

I am writing to know if you are still using this email address. I am
interested in discussing mutual cooperation with you.

I will enclose the proposal for your reference as soon as I receive your
response.

Regards,

Low Taek Jho

--000000000000c3b06605d555fb84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><font face=
=3D"georgia, serif">Hello,</font></div><div><font face=3D"georgia, serif"><=
br></font></div><div><font face=3D"georgia, serif"><br></font></div><div><f=
ont face=3D"georgia, serif">My name is Low Taek Jho, a Malaysian businessma=
n.</font></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><=
font face=3D"georgia, serif">I am writing to know if you are still using th=
is email address. I am interested in discussing mutual cooperation with you=
.</font></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><f=
ont face=3D"georgia, serif">I will enclose the proposal for your reference =
as soon as I receive your response.</font></div><div><font face=3D"georgia,=
 serif">=C2=A0</font></div><div><font face=3D"georgia, serif">Regards,</fon=
t></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><font fa=
ce=3D"georgia, serif">Low Taek Jho</font></div><div><br></div></div></div><=
/div></div>

--000000000000c3b06605d555fb84--

