Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C6661901
	for <lists+nbd@lfdr.de>; Sun,  8 Jan 2023 21:03:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9D43020A97; Sun,  8 Jan 2023 20:03:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jan  8 20:03:12 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 0F55520A84
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Jan 2023 19:46:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.581 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G8DYoYhzSSjq for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Jan 2023 19:45:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1CC6620A82
	for <nbd@other.debian.org>; Sun,  8 Jan 2023 19:45:56 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id y4so3643535iof.0
        for <nbd@other.debian.org>; Sun, 08 Jan 2023 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sixLOsZ8yqhAm0zOOA9NyfqkPHsrNvsw5zb1O1zq8Q4=;
        b=dA8/SF4w9aI0Y2NvFceRiMBO93U0xuTa47TxkKRxeVgdwhZys4K7LXn4SLU3acAOIP
         lp0t8bw148a/CV80dKkFhilp8pE8nIiLbE99cS0i1RpZLV7PsfcahWN23Hdc2b1Ydl0Z
         yhVaAPD8L0C6BTL2GOs/sjeQXl4eD83fKytScJCg1++ZY5YIYDKtWBvXUlxMJTorFRdX
         +R+49ZHPkbHoQIciaYnAVsiv5Tx2Zxpr8l/WjEtLvuAGGO2jEQsyTikRZw6HM1crkVJ0
         WCsW+BygczKa293egZ0uA5Ar8YZm5N/XnH3lPIkpX63nXZ46g+eNz0+po29/avIzAt0E
         ovQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sixLOsZ8yqhAm0zOOA9NyfqkPHsrNvsw5zb1O1zq8Q4=;
        b=hSQj4aqYo62yEiVBT9O2jeKnKS5NMjZEnf2WKj4D5MJ23u/VgGaL4EZM+C0MDeAjPu
         bo9eJDUfjf2LOzWjsVqnqlWoVVW1P00Tjzx9ISBo7iEZLFEUjH4mEL6UBEmCz85cZZG9
         1ZGjqGVDFhsMAN0y7Nt2uoLvZaLO3nxY+ev/CDpJv6tun4E/vaeEPQzV88ywawINsxT6
         jPe/125zKGqT01zv4qwKfN4cettDnQlIBYz9ZqR9AyVXkHWSyEOYeq4rNjzwVv33Zipg
         unVxAm7u/hk9hy+sU070IkDJyF57lh8yVZ+orse6/Ws91TVutPRuDGY4+C3l+ATKxOOl
         HNJA==
X-Gm-Message-State: AFqh2kq2rBNE6+pnHYLVznUFi1w/1cks2AAS0F7nt0qtXHddueR6hyi8
	B6PzgD+BJRrI88OcXnbuSmXU+q5EmAmxcSdG0uwAohYd3SdaCKui
X-Google-Smtp-Source: AMrXdXtjTjpC2zSgZY37zr8pHmBPLRbuSBsZ8bpEB25nG5S/8BC6ysDvw84JA1sz1SrOka/6PV3EziKeDFvg7pz2jac=
X-Received: by 2002:a92:2c03:0:b0:30c:33da:cb53 with SMTP id
 t3-20020a922c03000000b0030c33dacb53mr3782422ile.173.1673206824836; Sun, 08
 Jan 2023 11:40:24 -0800 (PST)
MIME-Version: 1.0
From: AGENCE IMMO <immobilierintern@gmail.com>
Date: Sun, 8 Jan 2023 19:40:13 +0000
Message-ID: <CAPrpWc7Ui5D1ZDCd51P6=0cYkR6OB5EPRdw3OJLqNPXVd9oG7A@mail.gmail.com>
Subject: =?UTF-8?Q?R=C3=A8glement=2DLoyer?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006e240c05f1c5d21c"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-xRNdvxSQxG.A.Q5H.AGyujB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2317
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPrpWc7Ui5D1ZDCd51P6=0cYkR6OB5EPRdw3OJLqNPXVd9oG7A@mail.gmail.com
Resent-Date: Sun,  8 Jan 2023 20:03:12 +0000 (UTC)

--0000000000006e240c05f1c5d21c
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

--0000000000006e240c05f1c5d21c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:3tx" class=3D"gmail-Ar gmail-Au gmail-Ao=
" style=3D"display:block"><div id=3D"gmail-:3yl" class=3D"gmail-Am gmail-Al=
 editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du mess=
age" role=3D"textbox" aria-multiline=3D"true" style=3D"direction:ltr;min-he=
ight:331px" tabindex=3D"1" aria-controls=3D":4ql"><div id=3D"gmail-:3u8" cl=
ass=3D"gmail-Ar gmail-Au gmail-Ao" style=3D"display:block"><div id=3D"gmail=
-:3uc" class=3D"gmail-Am gmail-Al editable gmail-LW-avf gmail-tS-tW gmail-t=
S-tY" aria-label=3D"Corps du message" role=3D"textbox" aria-multiline=3D"tr=
ue" style=3D"direction:ltr;min-height:331px" tabindex=3D"1" aria-controls=
=3D":4mq"><p style=3D"font-style:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing:c=
ontent-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sa=
ns-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"box-sizing:cont=
ent-box;line-height:1.4em;font-size:13.5pt;font-family:&quot;Times New Roma=
n&quot;,serif;color:rgb(20,20,20)">A votre aimable attention,</span></p><p =
style=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;ma=
rgin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;colo=
r:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;t=
ext-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-hei=
ght:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt=
"><span style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;=
font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)">En nouve=
lle ann=C3=A9e , nous vous informons qu&#39;une mise =C3=A0 jour a =C3=A9t=
=C3=A9 effectu=C3=A9e au sein de notre =C3=A9tablissement. De ce fait, nous=
 avons apport=C3=A9 quelques changements au niveau compta,<span class=3D"gm=
ail-Apple-converted-space">=C2=A0</span><br></span></p><p style=3D"font-sty=
le:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.00=
01pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);f=
ont-size:11pt"><span style=3D"box-sizing:content-box;line-height:1.4em;font=
-size:13.5pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,=
20)"><br></span></p><p style=3D"font-style:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;text-decoration:none;bo=
x-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:=
Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=
=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margin:=
0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb=
(68,68,68);font-size:11pt"><span style=3D"box-sizing:content-box;line-heigh=
t:1.4em;font-size:13.5pt;font-family:&quot;Times New Roman&quot;,serif;colo=
r:rgb(20,20,20)">Veuillez confirmer la r=C3=A9ception de notre diffusion, a=
fin de vous envoyer les nouvelles coordonn=C3=A9es bancaires pour le versem=
ent mensuel.</span></p><p style=3D"font-style:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;text-decoration:none=
;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-fami=
ly:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p styl=
e=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margin=
:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rg=
b(68,68,68);font-size:11pt"><span style=3D"box-sizing:content-box;line-heig=
ht:1.4em;font-size:13.5pt;font-family:Times,serif;color:rgb(12,12,12)">Vous=
 souhaitant une tr=C3=A8s bonne et heureuse ann=C3=A9e 2023, ainsi qu&#39;u=
ne bonne r=C3=A9ception de la pr=C3=A9sente.</span></p><p style=3D"font-sty=
le:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.00=
01pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);f=
ont-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:no=
ne;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-fa=
mily:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"=
box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font-family:Times=
,serif;color:rgb(14,14,14)">Bien cordialement,</span></p><p style=3D"font-s=
tyle:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.=
0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68)=
;font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:=
none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-=
family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><i style=3D"b=
ox-sizing:content-box;line-height:1.4em"><span style=3D"box-sizing:content-=
box;line-height:1.4em;font-size:13.5pt;font-family:Times,serif;color:rgb(60=
,115,191)">Le S.ervice G.estion L.ocative.</span></i></p></div></div></div>=
</div></div>

--0000000000006e240c05f1c5d21c--

