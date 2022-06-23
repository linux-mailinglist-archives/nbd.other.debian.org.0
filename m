Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3155812E
	for <lists+nbd@lfdr.de>; Thu, 23 Jun 2022 18:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F156620369; Thu, 23 Jun 2022 16:57:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 23 16:57:08 2022
Old-Return-Path: <rohan.khanna@thoughtworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	T_REMOTE_IMAGE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 21B4D20267
	for <lists-other-nbd@bendel.debian.org>; Thu, 23 Jun 2022 16:41:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.79 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001, T_REMOTE_IMAGE=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iKGVxll090UP for <lists-other-nbd@bendel.debian.org>;
	Thu, 23 Jun 2022 16:41:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .thoughtworks. - helo: .mail-lf1-x135.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2E8B22031E
	for <nbd@other.debian.org>; Thu, 23 Jun 2022 16:41:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c2so26624lfk.0
        for <nbd@other.debian.org>; Thu, 23 Jun 2022 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thoughtworks.com; s=thoughtworks;
        h=mime-version:from:date:message-id:subject:to;
        bh=xUEC2ltUMVaxidy1l1N5f6LVzuPgAwjwlCmoPES3AJ0=;
        b=EorDyzDkwmah5afLQhRU9btak1+maWT+QcUCvUGVmB+beNdL0j6FvxDni/HDcHYo9e
         yVQAlKgigO5irkz0WQiB7rOjDECWmp3WxCiejU8uPEsWK7ilrJxdwson7vrxPfz68Icz
         VnBebs2P56KH6804q/L5cOxiqPAmVIYHQRfxUzi9+Vh7bc+VWEFauajd5EeuRiVQyYL7
         cAToHlq0rb+CCXQ228Cj6xoCQsFDmx2amB2xSLPrWYK39TZcRSYgN2KxPtn0cjFUBUZ9
         9GlXOMpIMNkQt3S7xmbjBxFe1Ne3LLqrBEahkC5chmf7nSgzz3mv7fHG1jV1fXqykkAE
         OLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xUEC2ltUMVaxidy1l1N5f6LVzuPgAwjwlCmoPES3AJ0=;
        b=nzEAFxOht3gU6fIamFvF8wpuu+iTrgNQ1t3M87bKDSDe8kweaf1EPu7lJuneBJxRj9
         UIjYXRs5TI3Ajbq+dtvJjj0qot/W+ULqlLVW2vGHNxwbTqtw8SwMrWL/N2UhPCmXBUvN
         DknMnPhBiwAI4gk4lq1vhwgB02Q7HOX07Qzlzd1ytTjheaALhLV/moi4KL3mTh9vFcW8
         SPJMDYAoDx+9uRMjcnJM5FeBqwWJCdE/VyBKbr5mxHZfFDnyvNLfj5ExGbxAMjBFFEPP
         CjgK4Xb3Z+BxBB0Wd9nqmf6UBJQz1fj4R3+0odRNWHTuYfTZh4yvdiSphNBeTNKuLMBv
         MPSA==
X-Gm-Message-State: AJIora/JRqpCeZgPCcChJ3kvSGwZgfOnW4GZmjoswMA4Q3ZmI+/AfUGU
	FmF+r8ldz1NfrJpFa8RN3bIoGwBQEjrKYzQX41tkGcjLy4wFUA==
X-Google-Smtp-Source: AGRyM1uLeGFJINPG+gRIBkh9cgT2Q7TVzNZywpBKvDzDMAh/9+Z+eh35h9JjXUWtMW/YioWVTgf/FqDcY2ggmB6VQUM=
X-Received: by 2002:a05:6512:2828:b0:47f:68dc:9feb with SMTP id
 cf40-20020a056512282800b0047f68dc9febmr6012125lfb.475.1656002462532; Thu, 23
 Jun 2022 09:41:02 -0700 (PDT)
MIME-Version: 1.0
From: Rohan Khanna <rohan.khanna@thoughtworks.com>
Date: Thu, 23 Jun 2022 18:40:46 +0200
Message-ID: <CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com>
Subject: Requesting some information regarding building nbd-client for macos
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="00000000000086eb7505e2201e99"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WezhgbJOPML.A.dRB.ktJtiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2178
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com
Resent-Date: Thu, 23 Jun 2022 16:57:08 +0000 (UTC)

--00000000000086eb7505e2201e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello
I am writing to you requesting for some information as to how may I go
about building nbd-client for macos. Anything to point me in the right
direction would be greatly appreciated.
Kind regards,

Rohan Khanna
He/Him
Consultant Data Engineer
Email rohan.khanna@thoughtworks.com
[image: Thoughtworks]
<http://www.thoughtworks.com/?utm_campaign=3Drohan-khanna-signature&utm_med=
ium=3Demail&utm_source=3Dthoughtworks-email-signature-generator>
[image: Delivering extraordinary impact together. Learn more about
Thoughtworks]
<https://www.thoughtworks.com/?utm_source=3Demail-signature&utm_medium=3Dem=
ail&utm_campaign=3Dbrand>
ThoughtWorks Deutschland GmbH - Gro=C3=9Fer Burstah 46-48 - D-20457 Hamburg
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Dr. Peter Buhrmann
AG Hamburg - HRB 115336

--00000000000086eb7505e2201e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div>I am writing to you requesting for so=
me information as to how may I go about building nbd-client for macos. Anyt=
hing to point me in=C2=A0the right direction would be greatly appreciated.=
=C2=A0</div><div>Kind regards,</div><br clear=3D"all"><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" style=3D"color:=
rgb(34,34,34);caption-side:bottom;border-collapse:collapse;font-size:12px;l=
ine-height:12px;font-family:Inter,sans-serif;width:max-content"><tbody styl=
e=3D"border-width:0px;border-style:solid"><tr style=3D"border-width:0px;bor=
der-style:solid;font-family:Inter,Helvetica,Arial,sans-serif;color:rgb(51,5=
1,51)"><td colspan=3D"2" style=3D"font-family:Bitter,sans-serif;border-widt=
h:0px;border-style:solid;border-color:inherit;max-width:6rem;font-weight:70=
0;padding-bottom:4px;padding-right:1rem">Rohan Khanna</td></tr><tr style=3D=
"border-width:0px;border-style:solid;font-family:Inter,Helvetica,Arial,sans=
-serif;color:rgb(51,51,51)"><td style=3D"font-family:Inter,sans-serif;borde=
r-width:0px;border-style:solid;border-color:inherit;max-width:6rem;padding-=
bottom:4px">He/Him</td></tr><tr style=3D"border-width:0px;border-style:soli=
d;font-family:Inter,Helvetica,Arial,sans-serif;color:rgb(51,51,51)"><td col=
span=3D"2" style=3D"font-family:Inter,sans-serif;border-width:0px;border-st=
yle:solid;border-color:inherit;max-width:6rem;font-style:italic;padding-bot=
tom:12px">Consultant Data Engineer</td></tr><tr style=3D"border-width:0px;b=
order-style:solid;font-family:Inter,Helvetica,Arial,sans-serif;color:rgb(51=
,51,51)"><td style=3D"font-family:Inter,sans-serif;border-width:0px;border-=
style:solid;border-color:inherit;max-width:6rem;padding-bottom:4px;padding-=
right:1rem">Email</td><td style=3D"font-family:Inter,sans-serif;border-widt=
h:0px;border-style:solid;border-color:inherit;min-width:200px;font-weight:7=
00;padding-bottom:4px;padding-right:1rem"><a href=3D"mailto:rohan.khanna@th=
oughtworks.com" style=3D"color:white" target=3D"_blank"><span style=3D"colo=
r:rgb(189,66,87)">rohan.khanna@thoughtworks.com</span></a></td></tr><tr sty=
le=3D"border-width:0px;border-style:solid;font-family:Inter,Helvetica,Arial=
,sans-serif;color:rgb(51,51,51)"></tr><tr style=3D"border-width:0px;border-=
style:solid;font-family:Inter,Helvetica,Arial,sans-serif;color:rgb(51,51,51=
)"><td colspan=3D"2" style=3D"font-family:Inter,Helvetica,Arial,sans-serif;=
border-width:0px;border-style:solid;border-color:inherit;max-width:6rem"><a=
 href=3D"http://www.thoughtworks.com/?utm_campaign=3Drohan-khanna-signature=
&amp;utm_medium=3Demail&amp;utm_source=3Dthoughtworks-email-signature-gener=
ator" style=3D"color:rgb(13,110,253)" target=3D"_blank"><img src=3D"http://=
gentle-reef-2837.herokuapp.com/images/thoughtworks_logo.png" height=3D"31" =
alt=3D"Thoughtworks" title=3D"Thoughtworks" style=3D"vertical-align:middle;=
border-style:none;margin-top:10px;padding-top:8px;display:block;padding-rig=
ht:0px!important;padding-bottom:0px!important;padding-left:0px!important"><=
/a></td></tr><tr style=3D"border-width:0px;border-style:solid;font-family:I=
nter,Helvetica,Arial,sans-serif;color:rgb(51,51,51)"><td colspan=3D"2" styl=
e=3D"font-family:Inter,Helvetica,Arial,sans-serif;border-width:0px;border-s=
tyle:solid;border-color:inherit;max-width:6rem"><a href=3D"https://www.thou=
ghtworks.com/?utm_source=3Demail-signature&amp;utm_medium=3Demail&amp;utm_c=
ampaign=3Dbrand" style=3D"color:rgb(13,110,253)" target=3D"_blank"><img src=
=3D"http://gentle-reef-2837.herokuapp.com/images/tw_2021_email_footer2.jpg"=
 width=3D"460" alt=3D"Delivering extraordinary impact together. Learn more =
about Thoughtworks" title=3D"Delivering extraordinary impact together. Lear=
n more about Thoughtworks" style=3D"vertical-align:middle;border-style:none=
;margin-top:10px;padding-top:8px;display:block;padding-right:0px!important;=
padding-bottom:0px!important;padding-left:0px!important"></a></td></tr><tr =
style=3D"border-width:0px;border-style:solid;font-family:Inter,Helvetica,Ar=
ial,sans-serif;color:rgb(51,51,51)"></tr><tr style=3D"border-width:0px;bord=
er-style:solid;font-family:Inter,Helvetica,Arial,sans-serif;color:rgb(51,51=
,51)"></tr></tbody></table><span style=3D"color:rgb(34,34,34)">ThoughtWorks=
 Deutschland GmbH - Gro=C3=9Fer Burstah 46-48 - D-20457 Hamburg</span><br s=
tyle=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(34,34,34)">Sitz der G=
esellschaft: Hamburg</span><br style=3D"color:rgb(34,34,34)"><span style=3D=
"color:rgb(34,34,34)">Gesch=C3=A4ftsf=C3=BChrer: Dr. Peter Buhrmann</span><=
br style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(34,34,34)">AG Ham=
burg - HRB 115336</span><br></div></div></div></div>

--00000000000086eb7505e2201e99--

