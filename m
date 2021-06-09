Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 024743A1FA8
	for <lists+nbd@lfdr.de>; Thu, 10 Jun 2021 00:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3F70202C6; Wed,  9 Jun 2021 22:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  9 22:03:09 2021
Old-Return-Path: <stsllc22@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CAPINIT,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLY,HTML_MESSAGE,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A6DDE2022E
	for <lists-other-nbd@bendel.debian.org>; Wed,  9 Jun 2021 21:46:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.051 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, CAPINIT=0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	FREEMAIL_REPLY=1, HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MUniye3gRCH4 for <lists-other-nbd@bendel.debian.org>;
	Wed,  9 Jun 2021 21:46:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 150FC20132
	for <nbd@other.debian.org>; Wed,  9 Jun 2021 21:46:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id g20so40682960ejt.0
        for <nbd@other.debian.org>; Wed, 09 Jun 2021 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=tTverhXSiAT73XOa0//0lWilJ0DVqpGrVTkVuq7a4NI=;
        b=CpGPd9K/X/++/TxIW0UKMLJaOtrj1ajCuQZyb5DKfABi8Q+g+LIgNS198uyKSXNMSF
         KgZE0s4iM/bVfJZKWA1OnUOxYGkIfQvrrnYIhc5tzta40J+hZoodLB56iYqBNWhptQET
         MohuyTI26SCPdKbUhbAsx9t/8Lw+nHhmn2Y+r8MRcar/f2LbHxe3DVaas0HuwW8noiut
         lH1JJtGbvxAKSRMh2MH7QUCLrKVxP2xaEsuCcmaUjfIcmRK0Af/j8eGUWDENPPUm/4Ro
         TAtzfiGZQab0R3Cr+VFojTizJN334b4tFoQAXh5U1X5k8rm4PRyq4qgRc+ZLJnqHC5uh
         PPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=tTverhXSiAT73XOa0//0lWilJ0DVqpGrVTkVuq7a4NI=;
        b=NcfFDgB3jZ/gb90jZwJAmRVCQeeQeTGOhU0Q90hFnJpiZ4dcZMILPLnJ0dX7Q3X0V1
         TQ09f35inva+bR7QOCLYkmKLZjADOasPo6oMpBaWLyitDfNYyle80xf6XdJETN+V3sB6
         HKHCsVuVvUf7VDR3wZ6/LSwqkBXUv0ODLuIlPqTIqOBVFQ9MqjBjT39qQTSZ82faGR/V
         gQNkDEZDxoqBrIlcdBv/LuyoP6xkSMfBB7maH0DQMEd1utOKfiJzKwSPqIrnyPRAjduL
         56Jxc3/oTdqJifED36H0uK3kkQ+mphmNGwDhx4cU9pA0hB8RdcXnjhF5+nS+V8Wv34Jv
         QzDA==
X-Gm-Message-State: AOAM530OVTz+5bjh/cKZi44EQGolGdWqB/M5sSaxlhrU62nsCC0Pp6iR
	TEWyQAE6r1v6W4euFmSQ8nMdQHb5SrRCj9uEAbE=
X-Google-Smtp-Source: ABdhPJwfXq5GhRjB+FOEZobgrHvG9uQa7RSYHjI0EvNKOG0X1Z3nB66CCRlxXbp58r6n1gCM4hZLIcmSwneyhy4nhGc=
X-Received: by 2002:a17:906:340d:: with SMTP id c13mr1623724ejb.457.1623275203048;
 Wed, 09 Jun 2021 14:46:43 -0700 (PDT)
MIME-Version: 1.0
From: Kelly James Schaffer <jk203030@gmail.com>
Date: Wed, 9 Jun 2021 22:46:29 +0100
Message-ID: <CAFrK_hhodA-TbsRfbbmoZ6wBL0=bPyi38R57=mpY4VaiObghnA@mail.gmail.com>
Subject: Investment Opportunities
To: jk203030@gmail.com
Content-Type: multipart/alternative; boundary="000000000000d9b73d05c45c35b1"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WYTjocyhv1L.A.PXB.dqTwgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1211
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFrK_hhodA-TbsRfbbmoZ6wBL0=bPyi38R57=mpY4VaiObghnA@mail.gmail.com
Resent-Date: Wed,  9 Jun 2021 22:03:09 +0000 (UTC)

--000000000000d9b73d05c45c35b1
Content-Type: text/plain; charset="UTF-8"

We seek investment partnership in your country and will offer funds and if
you have interest, please call me or Phone Number +447440968712 or email to
us at kellys.schaffer@yahoo.com

--000000000000d9b73d05c45c35b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 10pt;line-h=
eight:115%;font-size:12pt;font-family:&quot;Lucida Console&quot;"><span sty=
le=3D"font-family:&quot;Times New Roman&quot;,serif;color:rgb(38,40,42)">We=
 seek investment
partnership in your country and will offer funds and if you have interest,<=
/span><span style=3D"font-family:&quot;Times New Roman&quot;,serif;color:rg=
b(93,93,93);background-image:initial;background-position:initial;background=
-size:initial;background-repeat:initial;background-origin:initial;backgroun=
d-clip:initial"> </span><span style=3D"font-family:&quot;Times New Roman&qu=
ot;,serif;color:rgb(32,33,36)">please call me or Phone
Number +447440968712 or email to us at </span><span style=3D"font-family:&q=
uot;Times New Roman&quot;,serif"><a href=3D"mailto:kellys.schaffer@yahoo.co=
m">kellys.schaffer@yahoo.com</a></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 10pt;line-height:115%;font-s=
ize:12pt;font-family:&quot;Lucida Console&quot;"><span style=3D"font-family=
:&quot;Times New Roman&quot;,serif;color:rgb(32,33,36)">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 10pt;line-height:115%;font-s=
ize:12pt;font-family:&quot;Lucida Console&quot;"><span style=3D"font-family=
:&quot;Times New Roman&quot;,serif;color:rgb(29,34,40)">=C2=A0</span></p>

<p style=3D"margin:0in 0in 0.25in;background-image:initial;background-posit=
ion:initial;background-size:initial;background-repeat:initial;background-or=
igin:initial;background-clip:initial;vertical-align:baseline;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,serif"><span style=3D"color:rgb(29=
,34,40)"> </span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Lucida Console&quot;"><span style=3D"font-family:&quot;Times =
New Roman&quot;,serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Lucida Console&quot;"><span style=3D"font-family:&quot;Times =
New Roman&quot;,serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Lucida Console&quot;"><span style=3D"font-family:&quot;Times =
New Roman&quot;,serif"></span></p></div>

--000000000000d9b73d05c45c35b1--

