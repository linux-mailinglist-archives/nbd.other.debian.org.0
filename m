Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DB399339
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 21:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CFCC820666; Wed,  2 Jun 2021 19:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 19:09:09 2021
Old-Return-Path: <saralkho@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MURPHY_SCAM1,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AB6DC2068F
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 18:52:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.901 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	MURPHY_SCAM1=0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1GmKbQpG1pNA for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 18:52:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 135932067F
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 18:52:17 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t3so4131824edc.7
        for <nbd@other.debian.org>; Wed, 02 Jun 2021 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ZhngEHPsez2pdzUhBmzCotKceqau00ChYYNR/6AuiZY=;
        b=FxLXywgC/7y65L9retJmEbsjF5T2yBG3ZlsGcRHzAEd8/eqOkSwPjrj5+uHvcu29z2
         fiWglqxXSPf+PX2Wia8QETWvV9Ompf0rU2J61vgk8ANP32d3kPlvGwOeWgGMLZOJpwYZ
         vHfADd930UU5H8lA/h+thluDGKHEb1xR+ZINbqhKSF/xLmJUf7+NxiLJGJmG2ucxRVYO
         x7nk+0/Qbj0DqTvswJ9LbR80zFcwlcnz79wJhNuhsvXzGRtuT/GLNMqaqpJRd2tpz2TL
         o6e31/u8iIn5ICCDnjrapM30Thdoamws1EpwOHvUXqHIrpRoIkYtcbyHXWZuPgzli4Eg
         pffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ZhngEHPsez2pdzUhBmzCotKceqau00ChYYNR/6AuiZY=;
        b=kBR1JmQ+un6ztyJlSUc1VAQGBwjJulrcpIjuySiaxhKifLlD5fPyTRgfM3JHk9iIl/
         hJ2BPd3lricXsUJXJWIdkzuQuNq14VY86YQAJxE5FpHsDVm2qCsOhzv4bBco+Q7iTwE5
         2twxSvFU7UUVg6oddWC38CHSVU4020eI9nRP5VJno5iHi1P7XX4i/QLC71FdF7e3seON
         RVan3Nd4K3Pl/lL+PpVfajXzUy5oMRpR6I64WlaxeMOdJw5hJENt6dUNSK33/mlYmNtR
         eUIqoHfvUtqyVQ9HxjrOmbBdiGrMDeDrCuLTVvPiqGdhr2C2PQT4vK3490q6FP4tFLCU
         K3KA==
X-Gm-Message-State: AOAM532RHSGo7i0m2DMpte4A+ZjrUs5znVrJ5GAUslyk232HKuqQSsZP
	x4KYn51NuuToKSSCwMqPdtRFyR0TSLHoJRoTwjY=
X-Google-Smtp-Source: ABdhPJwttw3kZzkiaWnR+MKZ/6fPWvnndHwXbOw6MloseGU1GPSFUqvSdh7re5cf0IPDwqFIeGZbte+1vjZfusQqVAM=
X-Received: by 2002:a05:6402:26d1:: with SMTP id x17mr40037518edd.14.1622659935633;
 Wed, 02 Jun 2021 11:52:15 -0700 (PDT)
MIME-Version: 1.0
Reply-To: nlsonbile@gmail.com
From: Nelson Bile <nlsonbile@gmail.com>
Date: Wed, 2 Jun 2021 18:52:07 +0000
Message-ID: <CAOSR_pTm6KRmETumyg1-mBr_sf=EdkZeG5FhEgRS7mNjxPxGEA@mail.gmail.com>
Subject: Read & reply
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000000e05da05c3ccf566"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <W72IY9gn27B.A.dbG.Vd9tgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1202
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOSR_pTm6KRmETumyg1-mBr_sf=EdkZeG5FhEgRS7mNjxPxGEA@mail.gmail.com
Resent-Date: Wed,  2 Jun 2021 19:09:09 +0000 (UTC)

--0000000000000e05da05c3ccf566
Content-Type: text/plain; charset="UTF-8"

Greetings  my good friend,

I am Mr.Nelson Bile, Please confirm to me the receipt of this message.I
have sent you this message many times but couldn't hear your
response.Please get back to me very important for more details.

Hon.Barrister Nelson Bile,Esq
Bile & Advocate
Office Address: 603,Rue De Ibis Bp.13364,Lome-Togo
Lome Togo, West Africa,

--0000000000000e05da05c3ccf566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings =C2=A0my good friend,<br><br>I am Mr.Nelson Bile=
, Please confirm to me the receipt of this message.I have sent you this mes=
sage many times but couldn&#39;t hear your response.Please get back to me v=
ery important for more details.<br><br>Hon.Barrister Nelson Bile,Esq<br>Bil=
e &amp; Advocate<br>Office Address: 603,Rue De Ibis Bp.13364,Lome-Togo<br>L=
ome Togo, West Africa,=C2=A0=C2=A0<br></div>

--0000000000000e05da05c3ccf566--

