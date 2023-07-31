Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD676A28D
	for <lists+nbd@lfdr.de>; Mon, 31 Jul 2023 23:18:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E6712040F; Mon, 31 Jul 2023 21:18:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 31 21:18:13 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	FVGT_m_MULTI_ODD,HTML_MESSAGE,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DA48220412
	for <lists-other-nbd@bendel.debian.org>; Mon, 31 Jul 2023 21:01:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.831 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, FVGT_m_MULTI_ODD=0.02, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ElJllWZEkxof for <lists-other-nbd@bendel.debian.org>;
	Mon, 31 Jul 2023 21:01:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 28E4D20417
	for <nbd@other.debian.org>; Mon, 31 Jul 2023 21:01:24 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-791c27bb91dso3191357241.0
        for <nbd@other.debian.org>; Mon, 31 Jul 2023 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690837281; x=1691442081;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4IMdOk+NBKd9YqZjb1BwV94+sXazuoJnWPo/DwfOYC4=;
        b=iB517P2uNGA7Zg0jugmQM8Eg7sz47BrIlEfhu2H0uWmjyCepTkul9Kp2gMJLGIzJvo
         TaVmS9GFGHM7aqrtSZek/fQD2ZWT2EOZt4alwmTSjAIlxr7NiFNIlFBwDxgjszBsGM2I
         M1zbQzp4/cQuGX2KhE89+4se7kOb87zNxNQ0oyDCFAmyrF3sLY3FQl+WRdB3zWXN8XD0
         BaeJBE1DwT0A8L+e7GxoqzFWERXuf/MwOsyxFMRveJqtB3XQqU26FPPfxjuFDlFqdwPV
         GH+7RtcXupprveXSjAwNHyYP8KEbBUKw2KIdFKM69q08hdVTcgEtHRH5UNSC/GwjGtxE
         ug1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690837281; x=1691442081;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4IMdOk+NBKd9YqZjb1BwV94+sXazuoJnWPo/DwfOYC4=;
        b=lfErS+GzhiIZqNm2yyb6D61feAGM5uOMYzAvLRctGQc909YLP/xkVd01oH62QXZrwB
         0EVXJGQvo2r02LELaJ/8Ts1qErxv6+4Zgbb1ANujQ1vw0hhM/l0/4oJgwXpq4GEudeZo
         PG/igZfIW2VcQuyR71o7DjXeMP6AidseE/qcAQLvSae5Z+GWffMj8G82iUquWKuKcZib
         0ZuRXXSvjXAYV3FK4XhYTWj8no6d19yrb5np/Q1ksJgX+zVvw/kaOn0Zfk5oZb0MeEtr
         9aw1kGGbZ1R8pug73iyjP33gyqfCrrP9MyBcjjrdqzvPhj8VBLw2U3EO1XshBb+MoXUe
         nYDg==
X-Gm-Message-State: ABy/qLaUxBCh818bZgKyepgOyyIQjXm8vnkmFb2cuDjzHVLQ4RaJ2QGu
	SpnUp84KAhKl1h9ukOAviSsLuvwSe+dDFjamsPX2xZQgM5o=
X-Google-Smtp-Source: APBJJlEZTqu0GlSaacbhVIT3bR9qFK6RUrITsTOkOUuVR8zq7biZ/R+gMKFIJPMOczA4LpEXaq+ZE8gOreZ9jX9uphc=
X-Received: by 2002:a67:fe0d:0:b0:444:d7f0:d27c with SMTP id
 l13-20020a67fe0d000000b00444d7f0d27cmr293725vsr.14.1690837280549; Mon, 31 Jul
 2023 14:01:20 -0700 (PDT)
MIME-Version: 1.0
From: Matt Panaro <matt.panaro@gmail.com>
Date: Mon, 31 Jul 2023 17:01:09 -0400
Message-ID: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
Subject: [PATCH] fix missing -F short-option for certfile [version 2]
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="0000000000007aef3d0601cebb0f"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RROirVytM2E.A.jXC.UUCykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2584
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com
Resent-Date: Mon, 31 Jul 2023 21:18:13 +0000 (UTC)

--0000000000007aef3d0601cebb0f
Content-Type: text/plain; charset="UTF-8"

see previous thread: https://lists.debian.org/nbd/2023/07/msg00021.html
for the motivation behind this refactor

in commit 1b8615, the `-F` short-option was accidentally refactored out of
the codebase, so that only the long-option for `-certfile` would work.
This commit restores the `-F` short-option, as well as conditionally
populating the `short_opts` string based on compilation-options for
`NETLINK` and `GNUTLS`
---
 nbd-client.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/nbd-client.c b/nbd-client.c
index dae4636..ac0419d 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -896,11 +896,14 @@ void disconnect(char* device) {
        close(nbd);
 }

+static const char *short_opts = "-B:b:c:d:gH:hlnN:PpRSst:uVx"
 #if HAVE_NETLINK
-static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
-#else
-static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
+       "L"
+#endif
+#if HAVE_GNUTLS
+       "A:C:F:K:"
 #endif
+       ;

 int main(int argc, char *argv[]) {
        char* port=NBD_DEFAULT_PORT;

--0000000000007aef3d0601cebb0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>see previous thread: <a href=3D"https://lists.debian.=
org/nbd/2023/07/msg00021.html">https://lists.debian.org/nbd/2023/07/msg0002=
1.html</a></div><div>for the motivation behind this refactor<br></div><div>=
<br>in commit 1b8615, the `-F` short-option was accidentally refactored out=
 of the codebase, so that only the long-option for `-certfile` would work.<=
br>This commit restores the `-F` short-option, as well as conditionally pop=
ulating the `short_opts` string based on compilation-options for `NETLINK` =
and `GNUTLS`<br>---<br>=C2=A0nbd-client.c | 9 ++++++---<br>=C2=A01 file cha=
nged, 6 insertions(+), 3 deletions(-)<br><br>diff --git a/nbd-client.c b/nb=
d-client.c<br>index dae4636..ac0419d 100644<br>--- a/nbd-client.c<br>+++ b/=
nbd-client.c<br>@@ -896,11 +896,14 @@ void disconnect(char* device) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(nbd);<br>=C2=A0}<br>=C2=A0<br>+static con=
st char *short_opts =3D &quot;-B:b:c:d:gH:hlnN:PpRSst:uVx&quot;<br>=C2=A0#i=
f HAVE_NETLINK<br>-static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:=
hK:LlnN:PpRSst:uVx&quot;;<br>-#else<br>-static const char *short_opts =3D &=
quot;-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx&quot;;<br>+ =C2=A0 =C2=A0 =C2=A0 &qu=
ot;L&quot;<br>+#endif<br>+#if HAVE_GNUTLS<br>+ =C2=A0 =C2=A0 =C2=A0 &quot;A=
:C:F:K:&quot;<br>=C2=A0#endif<br>+ =C2=A0 =C2=A0 =C2=A0 ;<br>=C2=A0<br>=C2=
=A0int main(int argc, char *argv[]) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 char* =
port=3DNBD_DEFAULT_PORT;<br></div></div>

--0000000000007aef3d0601cebb0f--

