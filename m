Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A775DD13
	for <lists+nbd@lfdr.de>; Sat, 22 Jul 2023 17:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 483052049B; Sat, 22 Jul 2023 15:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 22 15:06:12 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FVGT_m_MULTI_ODD,
	HTML_MESSAGE,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D50C0204CC
	for <lists-other-nbd@bendel.debian.org>; Sat, 22 Jul 2023 14:48:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.169 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	FVGT_m_MULTI_ODD=0.02, HTML_MESSAGE=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aV4iR4Eg1LpE for <lists-other-nbd@bendel.debian.org>;
	Sat, 22 Jul 2023 14:48:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 05341204DA
	for <nbd@other.debian.org>; Sat, 22 Jul 2023 14:48:23 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76ad842d12fso222976185a.3
        for <nbd@other.debian.org>; Sat, 22 Jul 2023 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690037300; x=1690642100;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDjtC5lLwQe24A2Rh7PYJXWhKEx8G3cuFKsaRWo0IdI=;
        b=crlHSx8RBNvWMQ3RKd5yPHfxdYvAQSCoBMGNBcR3d+Cr8Y4WT4hTRAyljVboSevJto
         GP7QdbH6mJeSzQLMb3sAD1g34Fy7OgFv2fDpVJwYAZdVzRNyHQ3CzD5z4iUePpt0vkQg
         3pnw9IHVtCA92DtXUsqUrryD+FpyHG0kL4lluAVJxpMvO/JLCKMfRJuOb2ZEGVL7OqBh
         cKCL00CSy0CKaGpt++iI243rvi5UobSbLFNbP+s9DlpCE0J1Ei5e+AqQ09PLpBnlzhn8
         tL2tfXSHU1dsyRFFj+bf+maaTmGcxFNC0lrh3vrUWCHb3l+0BCna4tw/UVJ6HxrsKKmU
         J+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690037300; x=1690642100;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDjtC5lLwQe24A2Rh7PYJXWhKEx8G3cuFKsaRWo0IdI=;
        b=RI1SKlH/+Op0/QSO/nceZRwxNj/64d8o8HXSzOuFfk8jicGPvthq0VfCLVQB8ghU4S
         eMWYA7erpa+yKuyafleHf/QYFwZigMqFfeOTg5c5oQfRJVmgqespeqn5Yy3wmK9/OOSt
         UGXjzUCB1jfJMvm7qNtKRdrJ4LzZhXXTuHQ1Xp6tdMzgQ+uHbfw1TWBk/yZJrHGQawcb
         h08CPjfvrF0JxPLMRrBAQQv4sUNjX/XXPHPhnwoVZwjcwH1eFPiREckJO6vcvt9+bYa4
         w4zkpvJhd3Gc0IMvPO7f2pyP2CwrUhZHf29jELUEgM2dVclUbxDj/7rOwffNwhmguSo7
         KXaA==
X-Gm-Message-State: ABy/qLYutX4LEKc+QQO/l5oPvBYPap8VbE/EYoNEDf0TG2VXMMf+nC5o
	z/iJl1YiMpIB9m2ehkk+WAJAj5GQcUdYbWnKnlRyqpWOi+E=
X-Google-Smtp-Source: APBJJlEjxfbWS3vz2H4tGSXLVeBhAohirLVUh5bStf2FkM3h/kjPksq3AfBkwTYDSNuhOkx7wec5ubCsuRNTRXRyrcc=
X-Received: by 2002:a05:620a:244f:b0:767:dd27:f91f with SMTP id
 h15-20020a05620a244f00b00767dd27f91fmr3790902qkn.4.1690037300676; Sat, 22 Jul
 2023 07:48:20 -0700 (PDT)
MIME-Version: 1.0
From: Matt Panaro <matt.panaro@gmail.com>
Date: Sat, 22 Jul 2023 10:48:08 -0400
Message-ID: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
Subject: patch to fix short-option for certfile (-F) in nbd-client
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000f6cc37060114786b"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v6LLd4vKJzD.A.JvD.kB_ukB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2576
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com
Resent-Date: Sat, 22 Jul 2023 15:06:12 +0000 (UTC)

--000000000000f6cc37060114786b
Content-Type: text/plain; charset="UTF-8"

--- a/nbd-client.c
+++ b/nbd-client.c
@@ -897,9 +900,9 @@ void disconnect(char* device) {
 }

 #if HAVE_NETLINK
-static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
+static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:LlnN:PpRSst:uVx";
 #else
-static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
+static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:lnN:PpRSst:uVx";
 #endif

 int main(int argc, char *argv[]) {

--000000000000f6cc37060114786b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">--- a/nbd-client.c<br>+++ b/nbd-client.c<br>@@ -897,9 +900=
,9 @@ void disconnect(char* device) {<br>=C2=A0}<br>=C2=A0<br>=C2=A0#if HAV=
E_NETLINK<br>-static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:hK:Ll=
nN:PpRSst:uVx&quot;;<br>+static const char *short_opts =3D &quot;-A:B:b:c:C=
:d:F:gH:hK:LlnN:PpRSst:uVx&quot;;<br>=C2=A0#else<br>-static const char *sho=
rt_opts =3D &quot;-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx&quot;;<br>+static const=
 char *short_opts =3D &quot;-A:B:b:c:C:d:F:gH:hK:lnN:PpRSst:uVx&quot;;<br>=
=C2=A0#endif<br>=C2=A0<br>=C2=A0int main(int argc, char *argv[]) {<br></div=
>

--000000000000f6cc37060114786b--

