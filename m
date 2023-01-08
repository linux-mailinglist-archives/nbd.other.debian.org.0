Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94C6618F7
	for <lists+nbd@lfdr.de>; Sun,  8 Jan 2023 20:57:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7524020A97; Sun,  8 Jan 2023 19:57:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jan  8 19:57:27 2023
Old-Return-Path: <tcharahien552@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,ONEWORD,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1EEC120A7B
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Jan 2023 19:42:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 795ZK9BidqaD for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Jan 2023 19:41:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C8DC920A6D
	for <nbd@other.debian.org>; Sun,  8 Jan 2023 19:41:53 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id o13so3906936ilc.7
        for <nbd@other.debian.org>; Sun, 08 Jan 2023 11:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/PE3MvTClGJ7PSxAs/PXZO3q4rMKT/OGP2PfGmqfvg=;
        b=Gzpf9iWl1ZTKZwmO4VPrJKNcY8wvHEPKaqC12jymo6lncRvXbksbB4gdLKUOI/qX5G
         cofW+kAyX1/qugj0m22gbIk2W2yj9KXJkpnP53SngL68R88fjWwdCPyRy9X7z6IL5fnL
         c0GLe8dLxN3Yef1KqvFj3STgzElWrb2P5nSyfCYgWTPtoO4Ghsk0dmLr+Db1IcrdwYAs
         IslkQ4DhfNZI6a2Q7KJJmb7Zbvu7XE+9vbw+IK+ZQDwX7XZeu81sTWS9e7F6utc6jYXf
         mXfCfH12ZbTCivMwPQSWTF+d9OS3gpE2XX5lDwYasqAo8X7p0UklsLQYca97B9q67UQL
         oBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/PE3MvTClGJ7PSxAs/PXZO3q4rMKT/OGP2PfGmqfvg=;
        b=A2odnQ908HWfea9l/mzaV26GJp1AuSD482EfoQqpVzNoMb2j4PRQ6GfEzo41D85K79
         88L18NrqANDbhReuVtMyOwQAS5FA5J8Bjxjxhzq4/jkeGCNtkoOsyEgDmCcfuZOyo5IC
         dFyNbddQThUIZW75KU8E8vYHsAl0ZbsJJMM8X4bCU2T1cU4t95yN50639+jq7kp/wL/T
         5YuciounrzWAcALG4MzLEzwGMAPUuTh7Pm+whmyytdH1a/EOS7ixF11ZxDzbjkBkLfQl
         z1OqLXMbZ33UuGZRC1tFuxNQgu0GlWM2J65myuAIg1QvCmKfFjppETdslTvkoc6K7NG1
         wEZQ==
X-Gm-Message-State: AFqh2koEtzfPXiM8zTviLIeLOqa5+6xu9Rt0eshSc5zfd8PMmVo4nLSU
	zeTV8fGCNX6O1XSSQ2zUzpWIgwzZJouHeTJT3I8=
X-Google-Smtp-Source: AMrXdXvcC7/EHVLD0qKYb2H6+fVibC0xjm7PJqsEUrslZzcPsZPr5CleBrCn01+o1TVajCLROFMuLiI7Q/E4lCW5bBk=
X-Received: by 2002:a92:cf4b:0:b0:30d:899f:aed2 with SMTP id
 c11-20020a92cf4b000000b0030d899faed2mr1359916ilr.214.1673206910467; Sun, 08
 Jan 2023 11:41:50 -0800 (PST)
MIME-Version: 1.0
From: AGENCE IMMO <immobilierintern@gmail.com>
Date: Sun, 8 Jan 2023 19:41:39 +0000
Message-ID: <CAPrpWc7u+--9e-mheG6xb7hShfkn_kjLAHxBfZ5zcR--SdtqrA@mail.gmail.com>
Subject: =?UTF-8?Q?R=C3=A8glement=2DLoyer?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000088c40405f1c5d709"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <W70l_n4zt2G.A.aJG.nAyujB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2316
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPrpWc7u+--9e-mheG6xb7hShfkn_kjLAHxBfZ5zcR--SdtqrA@mail.gmail.com
Resent-Date: Sun,  8 Jan 2023 19:57:27 +0000 (UTC)

--00000000000088c40405f1c5d709
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A votre aimable attention,



En nouvelle ann=C3=A9e , nous vous informons qu'une mise =C3=A0 jour a =C3=
=A9t=C3=A9 effectu=C3=A9e
au sein de notre =C3=A9tablissement. De ce fait, nous avons apport=C3=A9 qu=
elques
changements au niveau compta,




Veuillez confirmer la r=C3=A9ception de notre diffusion, afin de vous envoy=
er
les nouvelles coordonn=C3=A9es bancaires pour le versement mensuel.



Vous souhaitant une tr=C3=A8s bonne et heureuse ann=C3=A9e 2023, ainsi qu'u=
ne bonne
r=C3=A9ception de la pr=C3=A9sente.



Bien cordialement,



*Le S.ervice G.estion L.ocative.*

--00000000000088c40405f1c5d709
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:8r" class=3D"gmail-Ar gmail-Au gmail-Ao"=
 style=3D"display:block"><div id=3D"gmail-:8n" class=3D"gmail-Am gmail-Al e=
ditable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du messag=
e" role=3D"textbox" aria-multiline=3D"true" style=3D"direction:ltr;min-heig=
ht:331px" tabindex=3D"1" aria-controls=3D":ht"><div id=3D"m_214780829999738=
3324gmail-:3tx" style=3D"display:block"><div id=3D"m_2147808299997383324gma=
il-:3yl" aria-label=3D"Corps du message" role=3D"textbox" aria-multiline=3D=
"true" style=3D"direction:ltr;min-height:331px" aria-controls=3D":4ql"><div=
 id=3D"m_2147808299997383324gmail-:3u8" style=3D"display:block"><div id=3D"=
m_2147808299997383324gmail-:3uc" aria-label=3D"Corps du message" role=3D"te=
xtbox" aria-multiline=3D"true" style=3D"direction:ltr;min-height:331px" ari=
a-controls=3D":4mq"><p style=3D"font-style:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;text-decoration:none;bo=
x-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:=
Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"box-s=
izing:content-box;line-height:1.4em;font-size:13.5pt;font-family:&quot;Time=
s New Roman&quot;,serif;color:rgb(20,20,20)">A votre aimable attention,</sp=
an></p><p style=3D"font-style:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing:cont=
ent-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-=
serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001p=
t;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font=
-size:11pt"><span style=3D"box-sizing:content-box;line-height:1.4em;font-si=
ze:13.5pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)=
">En nouvelle ann=C3=A9e , nous vous informons qu&#39;une mise =C3=A0 jour =
a =C3=A9t=C3=A9 effectu=C3=A9e au sein de notre =C3=A9tablissement. De ce f=
ait, nous avons apport=C3=A9 quelques changements au niveau compta,<span>=
=C2=A0</span><br></span></p><p style=3D"font-style:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration=
:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font=
-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=
=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font-family:&=
quot;Times New Roman&quot;,serif;color:rgb(20,20,20)"><br></span></p><p sty=
le=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margi=
n:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:r=
gb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text=
-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height=
:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><=
span style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;fon=
t-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)">Veuillez co=
nfirmer la r=C3=A9ception de notre diffusion, afin de vous envoyer les nouv=
elles coordonn=C3=A9es bancaires pour le versement mensuel.</span></p><p st=
yle=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;marg=
in:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:=
rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;tex=
t-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-heigh=
t:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=
<span style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;fo=
nt-family:Times,serif;color:rgb(12,12,12)">Vous souhaitant une tr=C3=A8s bo=
nne et heureuse ann=C3=A9e 2023, ainsi qu&#39;une bonne r=C3=A9ception de l=
a pr=C3=A9sente.</span></p><p style=3D"font-style:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:=
none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-=
family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p =
style=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;ma=
rgin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;colo=
r:rgb(68,68,68);font-size:11pt"><span style=3D"box-sizing:content-box;line-=
height:1.4em;font-size:13.5pt;font-family:Times,serif;color:rgb(14,14,14)">=
Bien cordialement,</span></p><p style=3D"font-style:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoratio=
n:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;fon=
t-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><=
p style=3D"font-style:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;=
margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;co=
lor:rgb(68,68,68);font-size:11pt"><i style=3D"box-sizing:content-box;line-h=
eight:1.4em"><span style=3D"box-sizing:content-box;line-height:1.4em;font-s=
ize:13.5pt;font-family:Times,serif;color:rgb(60,115,191)">Le S.ervice G.est=
ion L.ocative.</span></i></p></div></div></div></div></div></div></div>

--00000000000088c40405f1c5d709--

