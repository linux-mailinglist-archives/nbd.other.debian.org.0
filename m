Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9504406D7
	for <lists+nbd@lfdr.de>; Sat, 30 Oct 2021 03:57:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFCC3202D4; Sat, 30 Oct 2021 01:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct 30 01:57:10 2021
Old-Return-Path: <mabelsanchez04000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CAPINIT,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	GMAIL,HTML_MESSAGE,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3D93F202B7
	for <lists-other-nbd@bendel.debian.org>; Sat, 30 Oct 2021 01:40:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.551 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CAPINIT=0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, GMAIL=1,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3PF4NPHp2GlF for <lists-other-nbd@bendel.debian.org>;
	Sat, 30 Oct 2021 01:40:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E6C972027C
	for <nbd@other.debian.org>; Sat, 30 Oct 2021 01:40:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h7so44983924ede.8
        for <nbd@other.debian.org>; Fri, 29 Oct 2021 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZASNGSweTBmcj9Umevbukh6oYaAC0xBG7fVWKwN+rVU=;
        b=B1dof9QWEy/ru44vKGr19anpoD+hNTy+m5H4yjI+j3cWagvg1a6GNYPyzQvuOcxgDv
         EIvfjcwTpoWzu2+kOENx2cbx9a0ByMOm72rC9TfMdr33DmUKBJKic8whLO8iEAExKrPE
         aBeW8+Nsl7mMQRJPxKsWOHfeZkVNUOmAsrQM2IsQYluZ8Z7CLOpYkgGtNSNjvx3jFQvS
         kEdlK5Z+X70DFyIZSyC75gFkH9kbo+opTPk3OMB8Mq8OM+BqKYqUbOdu/H46xV4GK2iB
         Dx1eAGxiRql6nvzErs4fapwd1tzfPgah6gLxxKlQ/I1KEin263Nywf7zpBRCyUYu2A67
         Xtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZASNGSweTBmcj9Umevbukh6oYaAC0xBG7fVWKwN+rVU=;
        b=Iu279oC+6dAnrDf7AjVIWmOMZ/KI/UszYoR1zNkxlaIT+1tt6h8DXuJ0/gnoPNTNaA
         JSneuhprcJs8QAtJ5ekweG5FIWlgoH/LiykHnNM1X3Ld7AnuERK4S7hLn/IkE+AMfBpe
         hxNnhO/znYBHF3uAXg0xKVfMiXwSTV8KfjjU1WVE+VTHxDY/71hyqYemv15Iq7b0M7yk
         ym+NY34lgnymvrgqyCqxAP4VIb87+F+t+eN3BtqOVFA1WArkKJCeao9ED7hlf7QYY7Yy
         WKhttS1MH/NQm9n/ydeTe1K+z6evonw5fNhYbgeVJKcoOtsgq6dvv0xnkawXgUEHeZaR
         sheQ==
X-Gm-Message-State: AOAM532ZTssOjEnneGwwG+sK3J884cWb/U1/GfzvgQvoUDj/Ehbbpndh
	Ev1G08Z3v9zi8j03Hpdfmg183EXnfwJNw+z/rFiIXHaP/AWLJ/Ai
X-Google-Smtp-Source: ABdhPJxYy/iTus2WdM/tcXn8fccBBRIRC3uFJSWYyEcRWKYq2dQ8gWsnYrCDMOJPvh+7TXSV8hz7zyDgDoYEgpQhy38=
X-Received: by 2002:a5d:584c:: with SMTP id i12mr18432386wrf.365.1635552348461;
 Fri, 29 Oct 2021 17:05:48 -0700 (PDT)
MIME-Version: 1.0
From: Mabel Sanchez <sgtmabelsanchez8@gmail.com>
Date: Sat, 30 Oct 2021 01:05:25 +0100
Message-ID: <CAG1hEdMJZ_Jp_u9o0CBeUEf18ZesSV3oGZLvHjZZKDXhn27m1Q@mail.gmail.com>
Subject: Hello Dear
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000bddc4f05cf86b497"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PQrPOaMB4ML.A.uXF.2ZKfhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1592
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAG1hEdMJZ_Jp_u9o0CBeUEf18ZesSV3oGZLvHjZZKDXhn27m1Q@mail.gmail.com
Resent-Date: Sat, 30 Oct 2021 01:57:10 +0000 (UTC)

--000000000000bddc4f05cf86b497
Content-Type: text/plain; charset="UTF-8"

Hello dear, My name is Sgt. Mabel Sanchez, please I have something I would
want to discuss with you privately and if you wouldn't mind.To make this
successful, please do communicate with me here
(sgtmabelsanchez8@gmail.com) .Thanks
dear,I'm waiting to hear from you soon.

--000000000000bddc4f05cf86b497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello dear, My name is Sgt. Mabel Sanchez, please I have s=
omething I would want to discuss with you privately and if you wouldn&#39;t=
 mind.To make this successful, please do communicate with me here=C2=A0 (<s=
pan style=3D"color:rgb(95,99,104);font-family:Roboto,RobotoDraft,Helvetica,=
Arial,sans-serif;font-size:14px;text-align:center;white-space:nowrap"><a hr=
ef=3D"mailto:sgtmabelsanchez8@gmail.com" target=3D"_blank">sgtmabelsanchez8=
@gmail.com</a>)</span>=C2=A0.Thanks dear,I&#39;m waiting to hear from you s=
oon.=C2=A0=C2=A0<br></div>

--000000000000bddc4f05cf86b497--

